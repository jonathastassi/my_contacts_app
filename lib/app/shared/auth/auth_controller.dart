import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_contacts_app/app/shared/auth/biometric_helper.dart';
import 'package:my_contacts_app/app/shared/auth/repositories/auth_repository_interface.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store, BiometricHelper {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  User user;

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }

  @action
  Future loginWithBiometria() async {
    if (await this.authenticate()) {
      user = await this._authRepository.getLoginAnnonymous();
    }
    print("controller " + user.toString());
  }

  @action
  Future loginWithGoogle() async {
    user = await this._authRepository.getGoogleLogin();
  }

  @action
  Future loginWithEmailAndPassword(String email, String password) async {
    user = await this._authRepository.getEmailPasswordLogin(email, password);
  }

  @action
  setUser(User u) => user = u;

  @action
  Future logout() async {
    await this._authRepository.logout();
  }
}
