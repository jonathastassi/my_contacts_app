import 'package:my_contacts_app/app/pages/splash_screen/splash_screen_page.dart';
import 'pages/splash_screen/splash_screen_controller.dart';
import 'package:my_contacts_app/app/modules/contacts/contacts_module.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts_app/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $SplashScreenController,
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          "/",
          child: (_, args) => SplashScreenPage(),
        ),
        // ModularRouter("/initial", module: InitialModule()),
        ModularRouter("/contacts", module: ContactsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
