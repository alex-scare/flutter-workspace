import 'package:intl/intl.dart';

extension DateExt on DateTime {
  DateFormat get _utcDateFormat => DateFormat('dd-MM-yyyy');
  DateFormat get _utcDateTimeFormat => DateFormat('dd-MM-yyyyTHH:mm:ss.SSS');

  toDateString() => _utcDateFormat.format(this);
  toDateTimeString() => _utcDateTimeFormat.format(this);

  String get weekdayName => DateFormat.EEEE().format(this);
  String get monthShortName => DateFormat.MMM().format(this);

  DateTime truncate() {
    return DateTime(year, month, day);
  }
}
