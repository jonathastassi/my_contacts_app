import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/modules/contacts/contacts_controller.dart';
import 'package:my_contacts_app/app/shared/components/card_component.dart';
import 'package:my_contacts_app/app/shared/layout/drawer_menu.dart';

class ContactFormPage extends StatefulWidget {
  final String title;
  const ContactFormPage({Key key, this.title = "Adicionando contato"})
      : super(key: key);

  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState
    extends ModularState<ContactFormPage, ContactsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: <Widget>[
                CardComponent(
                  title: "Dados Gerais",
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Nome"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Sobrenome"),
                      ),
                    ],
                  ),
                ),
                CardComponent(
                  title: "Endereço",
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "CEP"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Rua"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Número"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Bairro"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Cidade"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Estado"),
                      ),
                    ],
                  ),
                ),
                CardComponent(
                  title: "Contatos",
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Telefone"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "E-mail"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pop();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
