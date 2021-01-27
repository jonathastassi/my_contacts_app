import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_contacts_app/app/modules/contacts/contacts_controller.dart';
import 'package:my_contacts_app/app/shared/components/card_component.dart';
import 'package:my_contacts_app/app/shared/layout/drawer_menu.dart';
import 'package:my_contacts_app/app/shared/utils/utils.dart';

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

  final TextEditingController _controllerAddress = new TextEditingController();
  final TextEditingController _controllerNeighborhood =
      new TextEditingController();
  final TextEditingController _controllerCity = new TextEditingController();
  final TextEditingController _controllerState = new TextEditingController();

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
                          textInputAction: TextInputAction.next,
                          onChanged: controller.contact.setName,
                          initialValue: controller.contact.name,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Nome"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Informe o nome';
                            }
                            return null;
                          },
                        ),
                      ),
                      Observer(
                        builder: (_) => TextFormField(
                          textInputAction: TextInputAction.next,
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
                        textInputAction: TextInputAction.next,
                        onChanged: controller.updatePostalCode,
                        initialValue: controller.contact.postalCode,
                        keyboardType: TextInputType.text,
                        inputFormatters: [Utils.maskCEP],
                        decoration: InputDecoration(
                          labelText: "CEP",
                          helperText: "Digite o CEP para preencher o endereço",
                        ),
                      ),
                      Observer(builder: (_) {
                        _controllerAddress.text =
                            controller.contact.address ?? "";
                        return TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: _controllerAddress,
                          onChanged: controller.contact.setAddress,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Rua"),
                        );
                      }),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        initialValue: controller.contact.number,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Número"),
                      ),
                      Observer(builder: (_) {
                        _controllerNeighborhood.text =
                            controller.contact.neighborhood ?? "";
                        return TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: _controllerNeighborhood,
                          onChanged: controller.contact.setNeighborhood,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Bairro"),
                        );
                      }),
                      Observer(builder: (_) {
                        _controllerCity.text = controller.contact.city ?? "";
                        return TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: _controllerCity,
                          onChanged: controller.contact.setCity,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Cidade"),
                        );
                      }),
                      Observer(builder: (_) {
                        _controllerState.text = controller.contact.state ?? "";
                        return TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: _controllerState,
                          maxLength: 2,
                          onChanged: controller.contact.setState,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Estado"),
                        );
                      }),
                    ],
                  ),
                ),
                CardComponent(
                  title: "Contatos",
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        maxLength: 14,
                        onChanged: controller.contact.setPhone,
                        inputFormatters: [Utils.maskCellPhone],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(labelText: "Telefone"),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.send,
                        onChanged: controller.contact.setEmail,
                        initialValue: controller.contact.email,
                        keyboardType: TextInputType.emailAddress,
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
