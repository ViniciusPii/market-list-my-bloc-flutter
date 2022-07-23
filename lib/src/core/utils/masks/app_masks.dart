import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'number_decimal_input_formatter.dart';

class AppMasks {
  AppMasks._();

  static decimalMask({int? decimal, String? symbol}) => NumberDecimalInputFormatter(
        symbol: symbol ?? '',
        locale: 'pt_Br',
        decimalDigits: decimal ?? 2,
      );

  static FilteringTextInputFormatter onlyLetters = FilteringTextInputFormatter.allow(
    RegExp('[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+|s'),
  );

  static String formatDecimalNumber<T>({
    required T value,
    int? decimal,
    String? symbol,
  }) =>
      NumberFormat.currency(
        name: symbol ?? '',
        locale: 'pt_Br',
        decimalDigits: decimal ?? 2,
      ).format(value);

  static unMaskNumber(String value) {
    return value.replaceAll(RegExp('[^0-9]'), '');
  }
}
