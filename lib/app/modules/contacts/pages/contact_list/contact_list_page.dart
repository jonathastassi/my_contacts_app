import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/modules/contacts/contacts_controller.dart';
import 'package:my_contacts_app/app/modules/contacts/models/contact_model.dart';
import 'package:my_contacts_app/app/shared/layout/bottom_menu.dart';
import 'package:my_contacts_app/app/shared/utils/url_launcher.dart';

class ContactListPage extends StatefulWidget {
  final String title;
  const ContactListPage({Key key, this.title = "Contatos"}) : super(key: key);

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState
    extends ModularState<ContactListPage, ContactsController> {
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text("Contatos");
  final TextEditingController _filter = new TextEditingController();

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
              ),
              hintText: 'Buscar...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text(widget.title);
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
        actions: [
          IconButton(
            icon: _searchIcon,
            onPressed: _searchPressed,
          )
        ],
        centerTitle: true,
      ),
      bottomNavigationBar: BottomMenu(),
      body: Observer(builder: (_) {
        if (controller.list.length == 0) {
          return Center(
            child: Text("Nenhum contato cadastrado!"),
          );
        }

        return ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (BuildContext context, int index) {
            ContactModel contact = controller.list[index];
            return _buildContactItem(context, contact);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.createContact();
          Modular.to.pushNamed("/contacts/form/0").then((value) async {
            await this.controller.populateList();
          });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _generateInitials(String name, String lastName) {
    name = name.trim().toUpperCase();
    if (lastName.isEmpty) {
      return name[0] + name[name.length - 1];
    }
    lastName = lastName.trim().trimLeft().trimRight().toUpperCase();
    return name[0] + lastName[0];
  }

  Widget _buildContactItem(BuildContext context, ContactModel contact) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        onTap: () {
          _settingModalBottomSheet(context, contact);
        },
        leading: CircleAvatar(
          child: Text(
            _generateInitials(contact.name, contact.lastName),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          "${contact.name ?? "-"} ${contact.lastName ?? ""}",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "${contact.address ?? "-"} - ${contact.number ?? "-"}, CEP ${contact.postalCode ?? "-"}, ${contact.neighborhood ?? "-"}, ${contact.city ?? "-"}-${contact.state ?? "-"}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(contact.phone ?? "-"),
                Text(contact.email ?? "-"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext ctx, ContactModel contact) {
    controller.setControllersWithModel(contact);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        if (controller.contact == null) {
          Center(
            child: Text("Aguarde"),
          );
        }

        String notExist = "-";

        return Container(
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
              child: Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 16),
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: Text(
                      "${controller.contact.name ?? "-"} ${controller.contact.lastName ?? ""}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Rua",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${controller.contact.address ?? notExist}, ${controller.contact.number ?? "-"}",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Bairro:",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${controller.contact.neighborhood ?? notExist}",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Cidade:",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${controller.contact.city ?? notExist} - ${controller.contact.state ?? "-"}",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "CEP:",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${controller.contact.postalCode ?? notExist}",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Telefone:",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${controller.contact.phone ?? notExist}",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "E-mail:",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${controller.contact.email ?? notExist}",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        onPressed: () async {
                          Modular.to.pop();
                          Modular.to
                              .pushNamed(
                                  "/contacts/form/${contact.id.toString()}")
                              .then(
                            (value) async {
                              await this.controller.populateList();
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            Text("Editar"),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () async {
                          if (await controller.removeContact() > 0) {
                            Modular.to.pop();
                          }
                        },
                        child: Row(
                          children: [
                            Icon(Icons.delete),
                            Text("Deletar"),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        onPressed: contact.phone.isEmpty
                            ? null
                            : () async {
                                Modular.to.pop();
                                UrlLauncher.callTo(contact.phone);
                              },
                        child: Row(
                          children: [
                            Icon(Icons.phone),
                            Text("Ligar"),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: contact.address.isEmpty
                            ? null
                            : () async {
                                UrlLauncher.openMap(
                                    contact.address,
                                    contact.number,
                                    contact.city,
                                    contact.state);
                                Modular.to.pop();
                              },
                        child: Row(
                          children: [
                            Icon(Icons.map),
                            Text("GPS"),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: contact.email.isEmpty
                            ? null
                            : () async {
                                Modular.to.pop();
                                UrlLauncher.emailTo(contact.phone);
                              },
                        child: Row(
                          children: [
                            Icon(Icons.map),
                            Text("E-mail"),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
