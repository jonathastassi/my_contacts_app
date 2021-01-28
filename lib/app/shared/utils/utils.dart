import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Utils {
  static final maskCEP = MaskTextInputFormatter(
    mask: "#####-###",
    filter: {"#": RegExp(r'[0-9]')},
  );

  static final maskPhone = MaskTextInputFormatter(
    mask: "(##) ####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );

  static final maskCellPhone = MaskTextInputFormatter(
    mask: "(##) #####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );

  static final stateBR = <String>[
    '',
    'AC',
    'AL',
    'AM',
    'AP',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MG',
    'MS',
    'MT',
    'PA',
    'PB',
    'PE',
    'PI',
    'PR',
    'RJ',
    'RN',
    'RO',
    'RR',
    'RS',
    'SC',
    'SE',
    'SP',
    'TO',
  ];
}
