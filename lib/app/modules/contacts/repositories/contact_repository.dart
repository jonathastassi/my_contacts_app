import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/modules/contacts/models/contact_model.dart';
import 'package:my_contacts_app/app/shared/database/database.dart';

import 'interfaces/contact_repository_interface.dart';

class ContactRepository implements IContactRepository {
  final MyDatabase database = Modular.get();

  //dispose will be called automatically
  @override
  void dispose() {
    this.database.close();
  }

  @override
  Future<int> store(ContactModel entry) async {
    return await this.database.createContact(entry);
  }

  @override
  Future<int> update(ContactModel entry) async {
    return await this.database.updateContact(entry);
  }

  @override
  Future<int> delete(ContactModel entry) async {
    return await this.database.removeContact(entry);
  }

  @override
  Future<List<ContactModel>> getAll() async {
    var list = await this.database.getAllContacts();
    var listResponse = new List<ContactModel>();
    for (var item in list) {
      listResponse.add(ContactModel.fromJson(item.toJson()));
    }
    return listResponse;
  }
}
