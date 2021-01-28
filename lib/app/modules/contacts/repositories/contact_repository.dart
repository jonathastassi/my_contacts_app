import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/modules/contacts/dao/contacts_dao.dart';
import 'package:my_contacts_app/app/modules/contacts/models/contact_model.dart';
import 'interfaces/contact_repository_interface.dart';

class ContactRepository implements IContactRepository {
  final ContactsDao dao = Modular.get();

  @override
  Future<int> store(ContactModel entry) async {
    return await this.dao.createContact(entry);
  }

  @override
  Future<int> update(ContactModel entry) async {
    return await this.dao.updateContact(entry);
  }

  @override
  Future<int> delete(ContactModel entry) async {
    return await this.dao.removeContact(entry);
  }

  @override
  Future<List<ContactModel>> getAll() async {
    var list = await this.dao.getAllContacts();
    var listResponse = new List<ContactModel>();
    for (var item in list) {
      listResponse.add(ContactModel.fromJson(item.toJson()));
    }
    return listResponse;
  }

  @override
  Future<ContactModel> getById(int id) async {
    var entity = await this.dao.getContactById(id);
    return ContactModel.fromJson(entity.toJson());
  }
}
