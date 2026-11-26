import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date, {String locale = 'bn'}) {
    final format = DateFormat(
      'EEE, dd MMM yyyy',
      locale == 'bn' ? 'bn_BD' : 'en_US',
    );
    return format.format(date);
  }

  static String formatShortDate(DateTime date, {String locale = 'bn'}) {
    final format = DateFormat('dd MMM', locale == 'bn' ? 'bn_BD' : 'en_US');
    return format.format(date);
  }

  static String formatDayOfWeek(DateTime date, {String locale = 'bn'}) {
    final format = DateFormat('EEEE', locale == 'bn' ? 'bn_BD' : 'en_US');
    return format.format(date);
  }

  static String formatTime(String time24) {
    try {
      final parts = time24.split(':');
      if (parts.length >= 2) {
        final hour = int.parse(parts[0]);
        final min = int.parse(parts[1]);
        final dt = DateTime(2024, 1, 1, hour, min);
        return DateFormat('hh:mm a').format(dt);
      }
    } catch (_) {}
    return time24;
  }
}
