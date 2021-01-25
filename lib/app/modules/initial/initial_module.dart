import 'package:my_contacts_app/app/modules/initial/pages/home/home_page.dart';

import 'pages/home/home_controller.dart';
import 'initial_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
        $InitialController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          "/home",
          child: (_, args) => HomePage(),
        ),
      ];

  static Inject get to => Inject<InitialModule>.of();
}
