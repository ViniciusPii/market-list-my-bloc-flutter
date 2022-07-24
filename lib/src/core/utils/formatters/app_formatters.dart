import 'package:market_list_my_bloc/src/core/infra/utils/number_decimal_input_formatter.dart';

class AppFormatters {
  AppFormatters._();

  static gramsFormat(double value) => (value * 1000).toStringAsFixed(0);
  static moneyFormat(value) =>
      NumberDecimalInputFormatter.decimalFormat(value: value, symbol: 'R\$');
}
