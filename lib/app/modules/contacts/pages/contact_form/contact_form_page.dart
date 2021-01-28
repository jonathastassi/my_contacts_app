import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/modules/contacts/contacts_controller.dart';
import 'package:my_contacts_app/app/modules/contacts/validators/validators_contact.dart';
import 'package:my_contacts_app/app/shared/components/card_component.dart';
import 'package:my_contacts_app/app/shared/utils/phone_mask_formatter.dart';
import 'package:my_contacts_app/app/shared/utils/utils.dart';

class ContactFormPage extends StatefulWidget {
  final int id;

  const ContactFormPage({Key key, this.id}) : super(key: key);

  @override
  _ContactFormPageState createState() => _ContactFormPageState(id);
}

class _ContactFormPageState
    extends ModularState<ContactFormPage, ContactsController> {
  final _formKey = GlobalKey<FormState>();
  final int id;

  _ContactFormPageState(this.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.getById(this.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(controller.contact.id == null
              ? "Adicionando contato"
              : "Alterando contato"),
        ),
        centerTitle: true,
      ),
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
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: controller.nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Nome"),
                        validator: ValidatorsContact.isRequired,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: controller.lastNameController,
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
                        textInputAction: TextInputAction.next,
                        controller: controller.postalCodeController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [Utils.maskCEP],
                        decoration: InputDecoration(
                          labelText: "CEP",
                          helperText: "Digite o CEP para preencher o endereço",
                        ),
                      ),
                      Observer(
                        builder: (_) => TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: controller.addressController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Rua"),
                        ),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: controller.numberController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Número"),
                      ),
                      Observer(
                        builder: (_) => TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: controller.neighborhoodController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Bairro"),
                        ),
                      ),
                      Observer(
                        builder: (_) => TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: controller.cityController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Cidade"),
                        ),
                      ),
                      Observer(
                        builder: (_) => TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: controller.stateController,
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
                        textInputAction: TextInputAction.next,
                        inputFormatters: [PhoneMaskFormatter()],
                        controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(labelText: "Telefone"),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.send,
                        controller: controller.emailController,
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
            controller.submitFormContact();
            Modular.to.pop();
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
