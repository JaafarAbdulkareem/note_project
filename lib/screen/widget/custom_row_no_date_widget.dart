import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/screen/widget/custom_date_time_category_widget.dart';

class CustomRowNoDateWidget extends StatelessWidget {
  const CustomRowNoDateWidget({
    super.key,
    required this.no,
    required this.date,
  });
  final int no;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: FittedBox(
              child: CircleAvatar(
                backgroundColor: AppColor.main,
                child: Text(
                  no.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    // getResponsiveText(context, fontSize: 16),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(
              // width: 15,
              ),
        ),
        Expanded(
          flex: 3,
          child: CustomDateTimeCategoryWidget(
            date: date,
          ),
        ),
      ],
    );
  }
}
