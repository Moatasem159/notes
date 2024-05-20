import 'package:flutter/material.dart';
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

String timeOfDayToString(TimeOfDay time) {
  final String hour = time.hour.toString().padLeft(2, '0');
  final String minute = time.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

// Convert string to TimeOfDay
TimeOfDay stringToTimeOfDay(String timeString) {
  final List<String> parts = timeString.split(':');
  final int hour = int.parse(parts[0]);
  final int minute = int.parse(parts[1]);
  return TimeOfDay(hour: hour, minute: minute);
}