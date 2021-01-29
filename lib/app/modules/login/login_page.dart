import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/modules/login/validators/validators_login.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_add,
                      size: 100,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "My Contacts",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: controller.formKey,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              labelText: "E-mail",
                              hintText: "Digite o seu e-mail",
                            ),
                            validator: ValidatorsLogin.validEmail,
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              labelText: "Senha",
                              hintText: "Digite a sua senha",
                            ),
                            validator: ValidatorsLogin.validPassword,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 45,
                            child: RaisedButton(
                              onPressed: controller.loginWithEmailAndPassword,
                              child: Text("Entrar"),
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 45,
                            child: RaisedButton(
                              color: Colors.grey[200],
                              onPressed: controller.loginWithGoogle,
                              child: Text("Entrar com o Google"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
