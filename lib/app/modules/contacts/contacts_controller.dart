import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/modules/contacts/models/contact_model.dart';
import 'package:my_contacts_app/app/modules/contacts/repositories/interfaces/contact_repository_interface.dart';

part 'contacts_controller.g.dart';

@Injectable()
class ContactsController = _ContactsControllerBase with _$ContactsController;

abstract class _ContactsControllerBase with Store {
  final IContactRepository repository = Modular.get<IContactRepository>();

  @observable
  ObservableList<ContactModel> list = <ContactModel>[].asObservable();

  @observable
  ContactModel contact = new ContactModel();

  _ContactsControllerBase() {
    this.populateList();
  }

  Future populateList() async {
    print("populateList");
    list = <ContactModel>[].asObservable();
    List<ContactModel> listLocal = await this.repository.getAll();
    print(listLocal.length);

    if (listLocal == null) {
      list = <ContactModel>[].asObservable();
    } else {
      list.addAll(listLocal);
    }

    print(list.length);
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
      await this.populateList();
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
}
