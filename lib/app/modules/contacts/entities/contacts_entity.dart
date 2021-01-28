import 'package:moor/moor.dart';

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
