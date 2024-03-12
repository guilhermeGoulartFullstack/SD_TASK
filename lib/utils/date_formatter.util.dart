import 'package:intl/intl.dart';

class DateFormatter {
  static String complete(DateTime date) {
    return DateFormat("d 'de' MMM. 'de' yyyy").format(date);
  }

  static String resumed(DateTime date) {
    return DateFormat("dd/MM/yy").format(date);
  }
}
