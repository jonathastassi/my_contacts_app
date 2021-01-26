import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_contacts_app/app/modules/contacts/contacts_controller.dart';
import 'package:my_contacts_app/app/modules/contacts/models/contact_model.dart';
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
  final _formKey = GlobalKey<FormState>();
  final maskCEP = MaskTextInputFormatter(
    mask: "#####-###",
    filter: {"#": RegExp(r'[0-9]')},
  );

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
            key: _formKey,
            child: Column(
              children: <Widget>[
                CardComponent(
                  title: "Dados Gerais",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Observer(
                        builder: (_) => TextFormField(
                          onChanged: controller.contact.setName,
                          initialValue: controller.contact.name,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Nome"),
                          validator: (value) {
                            if (value == null) {
                              return 'Informe o nome';
                            }
                            return null;
                          },
                        ),
                      ),
                      Observer(
                        builder: (_) => TextFormField(
                          onChanged: controller.contact.setLastName,
                          initialValue: controller.contact.lastName,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Sobrenome"),
                        ),
                      ),
                    ],
                  ),
                ),
                CardComponent(
                  title: "Endereço",
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: controller.updatePostalCode,
                        initialValue: controller.contact.postalCode,
                        keyboardType: TextInputType.text,
                        inputFormatters: [maskCEP],
                        decoration: InputDecoration(
                          labelText: "CEP",
                          helperText: "Digite o CEP para preencher o endereço",
                        ),
                      ),
                      Observer(
                        builder: (_) => TextFormField(
                          onChanged: controller.contact.setAddress,
                          initialValue: controller.contact.address,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Rua"),
                        ),
                      ),
                      TextFormField(
                        initialValue: controller.contact.number,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Número"),
                      ),
                      Observer(
                        builder: (_) => TextFormField(
                          onChanged: controller.contact.setNeighborhood,
                          initialValue: controller.contact.neighborhood,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Bairro"),
                        ),
                      ),
                      Observer(
                        builder: (_) => TextFormField(
                          onChanged: controller.contact.setCity,
                          initialValue: controller.contact.city,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Cidade"),
                        ),
                      ),
                      Observer(
                        builder: (_) => TextFormField(
                          onChanged: controller.contact.setState,
                          initialValue: controller.contact.state,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Estado"),
                        ),
                      ),
                    ],
                  ),
                ),
                CardComponent(
                  title: "Contatos",
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: controller.contact.phone,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Telefone"),
                      ),
                      TextFormField(
                        initialValue: controller.contact.email,
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
          if (_formKey.currentState.validate()) {
            controller.addContact();
            Modular.to.pop();
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
