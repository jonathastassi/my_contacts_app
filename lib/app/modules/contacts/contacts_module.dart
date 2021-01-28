import 'package:my_contacts_app/app/modules/contacts/dao/contacts_dao.dart';
import 'package:my_contacts_app/app/modules/contacts/repositories/interfaces/contact_repository_interface.dart';
import 'package:my_contacts_app/app/shared/services/postal_code_service.dart';
import 'repositories/contact_repository.dart';
import 'package:my_contacts_app/app/modules/contacts/pages/contact_form/contact_form_page.dart';
import 'package:my_contacts_app/app/modules/contacts/pages/contact_list/contact_list_page.dart';
import 'contacts_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IContactRepository>((i) => ContactRepository()),
        Bind((i) => PostalCodeService(i.get())),
        Bind((i) => ContactsDao(i.get())),
        $ContactsController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          "/list",
          child: (_, args) => ContactListPage(),
        ),
        ModularRouter(
          "/form/:id",
          child: (_, args) => ContactFormPage(id: int.parse(args.params['id'])),
        ),
      ];

  static Inject get to => Inject<ContactsModule>.of();
}
