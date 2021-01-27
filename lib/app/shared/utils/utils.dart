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
}
