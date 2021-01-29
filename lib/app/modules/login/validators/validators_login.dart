class ValidatorsLogin {
  static String validEmail(String value) {
    if (value.isEmpty) {
      return 'Informe o e-mail';
    }

    if (value.contains("@")) {
      return 'Informe um e-mail válido';
    }
  }

  static String validPassword(String value) {
    if (value.isEmpty) {
      return 'Informe a senha';
    }
    if (value.length < 6) {
      return 'A senha deve conter no mínimo 6 caracteres';
    }
    return null;
  }
}
