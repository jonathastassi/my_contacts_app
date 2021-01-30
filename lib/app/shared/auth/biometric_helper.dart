import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricHelper {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate() async {
    if (await _isBiometricAvailable()) {
      await _getAvailableBiometrics();
      var autenticated = await _authenticateUser();
      return autenticated;
    }

    return false;
  }

  Future<bool> _isBiometricAvailable() async {
    try {
      return await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  Future _getAvailableBiometrics() async {
    try {
      await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<bool> _authenticateUser() async {
    try {
      var response = await auth.authenticateWithBiometrics(
          localizedReason: 'Entre com sua digital',
          useErrorDialogs: true,
          stickyAuth: true);
      return response;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }
}
