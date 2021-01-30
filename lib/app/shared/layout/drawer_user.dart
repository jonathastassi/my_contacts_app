import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/shared/auth/auth_controller.dart';

class DrawerUser extends StatelessWidget {
  final AuthController _auth = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: _auth.user.displayName == null
                  ? null
                  : Text(_auth.user.displayName),
              accountEmail: Text(_auth.user.email ?? "User"),
              currentAccountPicture: CircleAvatar(
                child: _auth.user.photoURL == null
                    ? Text(_auth.user.email != null
                        ? _auth.user.email[0]
                        : "User"[0].toUpperCase())
                    : Image.network(_auth.user.photoURL),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              onTap: () {
                _auth.logout().then(
                      (value) => Modular.to.pushReplacementNamed('/login'),
                    );
              },
            )
          ],
        ),
      ),
    );
  }
}
