import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_application/core/extension_language.dart';

String dateTimeFrame(DateTime dateTime) {
  DateFormat outputFormat = DateFormat('yyyy-MM-dd');
  String outputDate = outputFormat.format(dateTime);
  return outputDate;
}

String dateTimeCategory(BuildContext context, String dateTime) {
  // String x = dateTime.split('-').reversed.join();
  DateTime n = DateTime.parse(dateTime);
  String month = n.month.toString().tr(context);
  //     DateFormat.MMMM().format(n); //month name intl packages
  String dayYears = DateFormat("dd,yyyy").format(n);
  String data = '$month $dayYears';
  return data;
}
