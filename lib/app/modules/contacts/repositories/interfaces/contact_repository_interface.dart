import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/modules/contacts/models/contact_model.dart';

abstract class IContactRepository implements Disposable {
  Future<int> store(ContactModel entry);
  Future<int> update(ContactModel entry);
  Future<int> delete(ContactModel entry);
  Future<List<ContactModel>> getAll();
  Future<ContactModel> getById(int id);
}
