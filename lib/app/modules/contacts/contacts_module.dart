import 'package:my_contacts_app/app/modules/contacts/pages/contact_form/contact_form_page.dart';
import 'package:my_contacts_app/app/modules/contacts/pages/contact_list/contact_list_page.dart';

import 'contacts_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ContactsController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          "/list",
          child: (_, args) => ContactListPage(),
        ),
        ModularRouter(
          "/form",
          child: (_, args) => ContactFormPage(),
        ),
      ];

  static Inject get to => Inject<ContactsModule>.of();
}