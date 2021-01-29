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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
    );
  }
}
