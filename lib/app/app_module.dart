import 'package:dio/dio.dart';
import 'package:my_contacts_app/app/modules/home/home_module.dart';
import 'package:my_contacts_app/app/modules/contacts/contacts_module.dart';
import 'package:my_contacts_app/app/modules/splash_screen/splash_screen_module.dart';
import 'package:my_contacts_app/app/shared/database/database.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts_app/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => Dio()),
        Bind((i) => MyDatabase()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", module: SplashScreenModule()),
        ModularRouter("/home", module: HomeModule()),
        ModularRouter("/contacts", module: ContactsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
