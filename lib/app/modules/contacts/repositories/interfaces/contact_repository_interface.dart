import 'package:my_contacts_app/app/modules/contacts/models/contact_model.dart';

abstract class IContactRepository {
  Future<int> store(ContactModel entry);
  Future<int> update(ContactModel entry);
  Future<int> delete(ContactModel entry);
  Future<List<ContactModel>> getAll();
  Future<ContactModel> getById(int id);
}
