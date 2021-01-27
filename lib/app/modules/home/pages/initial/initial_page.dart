import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/shared/components/card_component.dart';
import 'package:my_contacts_app/app/shared/layout/bottom_menu.dart';
import 'initial_controller.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends ModularState<InitialPage, InitialController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Início"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomMenu(),
      body: Column(
        children: <Widget>[
          CardComponent(
              child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              title: "Bem-vindo"),
        ],
      ),
    );
  }
}
