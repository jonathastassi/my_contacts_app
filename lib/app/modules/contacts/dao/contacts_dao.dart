import 'package:moor/moor.dart';
import 'package:my_contacts_app/app/modules/contacts/entities/contacts_entity.dart';
import 'package:my_contacts_app/app/modules/contacts/models/contact_model.dart';
import 'package:my_contacts_app/app/shared/database/database.dart';

part 'contacts_dao.g.dart';

// the _ContactsDaoMixin will be created by moor. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@UseDao(tables: [Contacts])
class ContactsDao extends DatabaseAccessor<MyDatabase> with _$ContactsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  ContactsDao(MyDatabase db) : super(db);

  void dispose() {
    this.db.close();
  }

  Future<Contact> getContactById(int id) async {
    var entity =
        await (select(contacts)..where((tbl) => tbl.id.equals(id))).getSingle();
    return entity;
  }

  Future<List<Contact>> getAllContacts() async {
    var list = await (select(contacts)
          ..orderBy(
            [
              (u) => OrderingTerm(expression: u.name.upper()),
            ],
          ))
        .get();
    return list;
  }

  Future<int> createContact(ContactModel entry) async {
    var generatedId = await into(contacts).insert(
      ContactsCompanion.insert(
        name: entry.name,
        lastName: Value(entry.lastName),
        postalCode: Value(entry.postalCode),
        address: Value(entry.address),
        number: Value(entry.number),
        neighborhood: Value(entry.neighborhood),
        city: Value(entry.city),
        state: Value(entry.state),
        phone: Value(entry.phone),
        email: Value(entry.email),
      ),
    );
    return generatedId;
  }

  Future<int> updateContact(ContactModel entry) async {
    return (update(contacts)
          ..where(
            (t) => t.id.equals(entry.id),
          ))
        .write(
      ContactsCompanion(
        name: Value(entry.name),
        lastName: Value(entry.lastName),
        postalCode: Value(entry.postalCode),
        address: Value(entry.address),
        number: Value(entry.number),
        neighborhood: Value(entry.neighborhood),
        city: Value(entry.city),
        state: Value(entry.state),
        phone: Value(entry.phone),
        email: Value(entry.email),
      ),
    );
  }

  Future<int> removeContact(ContactModel entry) async {
    return await (delete(contacts)..where((t) => t.id.equals(entry.id))).go();
  }
}
