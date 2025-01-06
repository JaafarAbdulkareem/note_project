import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/function/date_time_function.dart';
import 'package:note_application/function/respponsive_text_function.dart';

class CustomDateTimeCategoryWidget extends StatelessWidget {
  const CustomDateTimeCategoryWidget({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        dateTimeCategory(context, date),
        style: TextStyle(
          color: CategoryColor.dateTime,
          fontSize: getResponsiveText(context, fontSize: 8.8),
        ),
        overflow: TextOverflow.visible,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
