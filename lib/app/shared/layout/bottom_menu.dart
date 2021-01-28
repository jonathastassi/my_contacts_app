import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Modular.to.pushReplacementNamed("/home");
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.home),
                    Text("Início"),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 90,
              height: 50,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Modular.to.pushReplacementNamed("/contacts/list");
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.person_sharp),
                    Text("Contatos"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
