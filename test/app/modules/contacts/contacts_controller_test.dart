import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_contacts_app/app/modules/contacts/contacts_controller.dart';
import 'package:my_contacts_app/app/modules/contacts/contacts_module.dart';

void main() {
  initModule(ContactsModule());
  // ContactsController contacts;
  //
  setUp(() {
    //     contacts = ContactsModule.to.get<ContactsController>();
  });

  group('ContactsController Test', () {
    //   test("First Test", () {
    //     expect(contacts, isInstanceOf<ContactsController>());
    //   });

    //   test("Set Value", () {
    //     expect(contacts.value, equals(0));
    //     contacts.increment();
    //     expect(contacts.value, equals(1));
    //   });
  });
}
