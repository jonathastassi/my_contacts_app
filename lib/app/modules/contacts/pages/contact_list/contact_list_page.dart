import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/modules/contacts/contacts_controller.dart';
import 'package:my_contacts_app/app/shared/layout/drawer_menu.dart';

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
      drawer: DrawerMenu(),
      body: ListView(
        children: [
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
          _buildContactItem(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed("/contacts/form");
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildContactItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        onTap: () {
          _settingModalBottomSheet(context);
        },
        leading: CircleAvatar(
          child: Text(
            "JT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          "Jonathas Tassi e Silva",
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
              "Rua Sargento Luiz Fioco, CEP 13323-777, Parque Imperial, Salto-SP",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("11 94064-1278"),
                Text("jonathastassi@hotmail.com")
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
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
                      "Jonathas Tassi e Silva",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rua Sargento Luiz Fioco, 215",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        "Parque Imperial",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Salto-SP",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        "CEP 13323-777",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "11 94064-1278",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        "jonathastassi@hotmail.com",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            ));
      },
    );
  }
}
