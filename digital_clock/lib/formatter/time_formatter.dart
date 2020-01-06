import 'package:intl/intl.dart';

class TimeFormatter {
  static String formatHour24(DateTime dateTime) {
    return DateFormat("HH").format(dateTime);
  }

  static String formatMinute(DateTime dateTime) {
    return DateFormat("mm").format(dateTime);
  }

  static String formatSecond(DateTime dateTime) {
    return DateFormat("ss").format(dateTime);
  }
}