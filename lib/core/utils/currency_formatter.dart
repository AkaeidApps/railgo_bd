import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

class CurrencyFormatter {
  static String format(num amount, {String locale = 'bn'}) {
    final NumberFormat formatter = NumberFormat.currency(
      symbol: AppConstants.currencySymbol,
      decimalDigits: 0,
      locale: locale == 'bn' ? 'bn_BD' : 'en_US',
    );
    return formatter.format(amount);
  }

  static String formatWithCode(num amount, {String locale = 'bn'}) {
    return '${format(amount, locale: locale)} ${AppConstants.currencyCode}';
  }
}
