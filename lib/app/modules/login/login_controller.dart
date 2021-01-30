import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/shared/auth/auth_controller.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController auth = Modular.get();

  @observable
  final formKey = GlobalKey<FormState>();

  @observable
  bool loading = false;

  @observable
  var emailController = TextEditingController();

  @observable
  var passwordController = TextEditingController();

  @action
  Future authenticateWithBiometria() async {
    try {
      await auth.loginWithBiometria();
      if (auth.user != null) {
        Modular.to.pushReplacementNamed('/home');
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  Future loginWithEmailAndPassword() async {
    try {
      if (formKey.currentState.validate()) {
        loading = true;

        await auth.loginWithEmailAndPassword(
            emailController.text, passwordController.text);

        if (auth.user != null) {
          Modular.to.pushReplacementNamed('/home');
        }
      }
    } catch (e) {
      loading = false;
    }
  }

  @action
  Future loginWithGoogle() async {
    try {
      loading = true;

      await auth.loginWithGoogle();

      if (auth.user != null) {
        Modular.to.pushReplacementNamed('/home');
      }
    } catch (e) {
      loading = false;
    }
  }
}
