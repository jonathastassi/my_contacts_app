import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneMaskFormatter extends MaskTextInputFormatter {
  static String maskA = "(##) ####-####";
  static String maskB = "(##) #####-####";

  PhoneMaskFormatter({String initialText})
      : super(
            mask: maskA,
            filter: {"#": RegExp(r'[0-9]')},
            initialText: initialText);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 14 || newValue.text.length == 0) {
      if (getMask() != maskB) {
        updateMask(mask: maskB);
      }
    } else {
      if (getMask() != maskA) {
        updateMask(mask: maskA);
      }
    }
    return super.formatEditUpdate(oldValue, newValue);
  }
}
