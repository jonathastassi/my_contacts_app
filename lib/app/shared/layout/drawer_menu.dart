import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Início"),
            onTap: () {
              Navigator.pop(context);
              Modular.to.pushReplacementNamed('/initial/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Contatos"),
            onTap: () {
              Navigator.pop(context);
              Modular.to.pushReplacementNamed('/contacts/list');
            },
          ),
        ],
      ),
    );
  }
}
