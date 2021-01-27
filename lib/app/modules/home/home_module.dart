import 'package:my_contacts_app/app/modules/home/pages/initial/initial_page.dart';

import 'pages/initial/initial_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $InitialController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          "/initial",
          child: (_, args) => InitialPage(),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
