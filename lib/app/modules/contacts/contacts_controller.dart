import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/modules/contacts/models/contact_model.dart';
import 'package:my_contacts_app/app/modules/contacts/repositories/interfaces/contact_repository_interface.dart';
import 'package:my_contacts_app/app/shared/models/postal_code_model.dart';
import 'package:my_contacts_app/app/shared/services/postal_code_service.dart';

part 'contacts_controller.g.dart';

@Injectable()
class ContactsController = _ContactsControllerBase with _$ContactsController;

abstract class _ContactsControllerBase with Store {
  final IContactRepository repository = Modular.get<IContactRepository>();
  final PostalCodeService postalCodeService = Modular.get();

  @observable
  ObservableList<ContactModel> list = <ContactModel>[].asObservable();

  @observable
  ContactModel contact;

  var nameController = TextEditingController();
  var lastNameController = TextEditingController();
  var postalCodeController = TextEditingController();

  @observable
  var addressController = TextEditingController();

  var numberController = TextEditingController();

  @observable
  var neighborhoodController = TextEditingController();

  @observable
  var cityController = TextEditingController();

  @observable
  var stateController = TextEditingController();

  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  _ContactsControllerBase() {
    this.populateList();

    postalCodeController.addListener(() async {
      if (postalCodeController.text.length == 9) {
        await this.findPortalCode();
      }
    });
  }

  populateList() async {
    list = <ContactModel>[].asObservable();
    list.addAll(await this.repository.getAll());
  }

  @action
  createContact() {
    _resetContact();
  }

  void _resetContact() {
    contact = ContactModel();
  }

  void _setModelWithController() {
    contact.name = nameController.text;
    contact.lastName = lastNameController.text;

    contact.postalCode = postalCodeController.text;
    contact.address = addressController.text;
    contact.number = numberController.text;
    contact.neighborhood = neighborhoodController.text;
    contact.city = cityController.text;
    contact.state = stateController.text;

    contact.phone = phoneController.text;
    contact.email = emailController.text;
  }

  @action
  submitFormContact() async {
    var id;

    _setModelWithController();

    if (contact.id == null) {
      id = await repository.store(contact);
    } else {
      id = await repository.update(contact);
    }

    if (id > 0) {
      _resetContact();
    }
  }

  @action
  getById(int id) async {
    if (id == 0) {
      setControllersWithModel(new ContactModel());
    } else {
      var contact = await this.repository.getById(id);
      setControllersWithModel(contact);
    }
  }

  @action
  setControllersWithModel(ContactModel contact) {
    this.contact = contact;

    nameController.text = contact.name;
    lastNameController.text = contact.lastName;

    postalCodeController.text = contact.postalCode;
    addressController.text = contact.address;
    numberController.text = contact.number;
    neighborhoodController.text = contact.neighborhood;
    cityController.text = contact.city;
    stateController.text = contact.state;

    phoneController.text = contact.phone;
    emailController.text = contact.email;
  }

  @action
  Future<int> removeContact() async {
    var id = await repository.delete(contact);
    if (id > 0) {
      _resetContact();
      await this.populateList();
    }
    return id;
  }

  @action
  findPortalCode() async {
    PostalCodeModel postalCodeModel =
        await this.postalCodeService.find(postalCodeController.text);

    if (postalCodeModel != null) {
      addressController.text = postalCodeModel.logradouro;
      neighborhoodController.text = postalCodeModel.bairro;
      cityController.text = postalCodeModel.localidade;
      stateController.text = postalCodeModel.uf;
    }
  }
}
