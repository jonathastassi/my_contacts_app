import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:my_contacts_app/app/modules/contacts/models/contact_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'database.g.dart';

class Contacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get lastName => text().nullable()();
  TextColumn get postalCode => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get number => text().nullable()();
  TextColumn get neighborhood => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Contacts])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

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
