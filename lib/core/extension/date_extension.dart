import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
extension StringExtension on DateTime {
  String formatDate() {
    final DateTime now = DateTime.now();
    final bool sameYear = now.year == this.year;
    final monthName = DateFormat('MMMM').format(this);
    final year = sameYear ? '' : ' ${this.year}';
    return '$day $monthName$year';
  }
}
extension FormatTime on TimeOfDay {
  String getInitialTime() {
    final DateTime now = DateTime.now();
    final DateTime futureTime =
        DateTime(now.year, now.month, now.day, this.hour, minute)
            .add(const Duration(hours: 2));
    final int hour =
        futureTime.hour == 0 || futureTime.hour == TimeOfDay.hoursPerPeriod
            ? TimeOfDay.hoursPerPeriod
            : futureTime.hour % TimeOfDay.hoursPerPeriod;
    final String formattedHour = hour.toString();
    const String min = "00";
    final DayPeriod period = futureTime.hour < TimeOfDay.hoursPerPeriod
        ? DayPeriod.am
        : DayPeriod.pm;
    final String dayPeriod = period == DayPeriod.am ? "am" : "pm";
    return "$formattedHour:$min $dayPeriod";
  }
  String formatTime() {
    final int hour = this.hour == 0 || this.hour == TimeOfDay.hoursPerPeriod
        ? TimeOfDay.hoursPerPeriod
        : this.hour % TimeOfDay.hoursPerPeriod;
    final String formattedHour = hour.toString();
    final String min = minute.toString().padLeft(2,'0');
    final String period = this.period == DayPeriod.am ? 'am' : 'pm';
    return "$formattedHour:$min $period";
  }
}
extension DateComparison on String {
  (bool, bool) checkDay() {
    final DateTime date = DateFormat('d MMM').parse(this);
    final bool isToday;
    final bool isTomorrow;
    if(date.day==DateTime.now().day){
      isToday = true;
    }
    else {
      isToday = false;
    }
    if(date.day==DateTime.now().day+1){
      isTomorrow = true;
    }
    else {
      isTomorrow = false;
    }
    return (isToday, isTomorrow);
  }
}