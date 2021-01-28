class ValidatorsContact {
  static String isRequired(value) {
    if (value.isEmpty) {
      return 'Informe o nome';
    }
    return null;
  }
}
