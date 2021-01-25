import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_contacts_app/app/modules/contacts/pages/contact_form/contact_form_controller.dart';
import 'package:my_contacts_app/app/modules/contacts/contacts_module.dart';

void main() {
  initModule(ContactsModule());
  // ContactFormController contactform;
  //
  setUp(() {
    //     contactform = ContactsModule.to.get<ContactFormController>();
  });

  group('ContactFormController Test', () {
    //   test("First Test", () {
    //     expect(contactform, isInstanceOf<ContactFormController>());
    //   });

    //   test("Set Value", () {
    //     expect(contactform.value, equals(0));
    //     contactform.increment();
    //     expect(contactform.value, equals(1));
    //   });
  });
}
