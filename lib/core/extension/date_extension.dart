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
  (bool, bool) checkDay() {
    final bool isToday;
    final bool isTomorrow;
    if(day==DateTime.now().day){
      isToday = true;
    }
    else {
      isToday = false;
    }
    if(day==DateTime.now().day+1){
      isTomorrow = true;
    }
    else {
      isTomorrow = false;
    }
    return (isToday, isTomorrow);
  }
}
extension FormatTime on TimeOfDay {
  String formatTime() {
    final int hour = this.hour == 0 || this.hour == TimeOfDay.hoursPerPeriod
        ? TimeOfDay.hoursPerPeriod
        : this.hour % TimeOfDay.hoursPerPeriod;
    final String formattedHour = hour==0?'12':hour.toString();
    final String min = minute.toString().padLeft(2,'0');
    final String period = this.period == DayPeriod.am ? 'am' : 'pm';
    return "$formattedHour:$min $period";
  }
}