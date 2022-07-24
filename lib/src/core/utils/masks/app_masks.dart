import 'package:flutter/services.dart';
import 'package:market_list_my_bloc/src/core/infra/utils/number_decimal_input_formatter.dart';

class AppMasks {
  AppMasks._();

  static moneyMask() => NumberDecimalInputFormatter(symbol: 'R\$', decimalDigits: 2);

  static weightMask() => NumberDecimalInputFormatter(symbol: 'Kg', decimalDigits: 3);

  static FilteringTextInputFormatter onlyLetters = FilteringTextInputFormatter.allow(
    RegExp('[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+|s'),
  );
}
