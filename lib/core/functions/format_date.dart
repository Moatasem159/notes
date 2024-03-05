import 'package:intl/intl.dart';
String formatCustomDate(String iso8601Date) {
  DateTime inputDate = DateTime.parse(iso8601Date);
  DateTime currentDate = DateTime.now();
  if (inputDate.day == currentDate.day) {
    return DateFormat('hh:mm a').format(inputDate);
  } else if (inputDate.year != currentDate.year) {
    return DateFormat('d MMM y').format(inputDate);
  } else {
    return DateFormat('d MMM').format(inputDate);
  }
}