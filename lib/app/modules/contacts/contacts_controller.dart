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
  ContactModel contact = new ContactModel();

  _ContactsControllerBase() {
    this.populateList();
  }

  populateList() async {
    list = <ContactModel>[].asObservable();
    list.addAll(await this.repository.getAll());

    // if (listLocal == null) {
    //   list = <ContactModel>[].asObservable();
    // } else {
    //   list.addAll(listLocal);
    // }
  }

  @action
  createContact() {
    _resetContact();
  }

  void _resetContact() {
    contact = ContactModel();
  }

  @action
  addContact() async {
    var id = await repository.store(contact);

    if (id > 0) {
      _resetContact();
    }
  }

  @action
  setContact(ContactModel contact) {
    this.contact = contact;
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

  findPortalCode() async {
    PostalCodeModel postalCodeModel =
        await this.postalCodeService.find(contact.postalCode);

    if (postalCodeModel != null) {
      contact.setAddress(postalCodeModel.logradouro);
      contact.setNeighborhood(postalCodeModel.bairro);
      contact.setCity(postalCodeModel.localidade);
      contact.setState(postalCodeModel.uf);
    }
  }

  @action
  updatePostalCode(String value) async {
    contact.setPostalCode(value);
    if (contact.postalCode.length == 9) {
      await this.findPortalCode();
    }
  }
}
