import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/function/respponsive_text_function.dart';

class CustomerMessageLinkWidget extends StatelessWidget {
  const CustomerMessageLinkWidget({
    super.key,
    required this.message,
    required this.link,
    required this.onTap,
  });
  final String message, link;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(
            fontSize: getResponsiveText(context, fontSize: 14),
          ),
        ),
        const SizedBox(width: 4),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              link,
              style: TextStyle(
                fontSize: getResponsiveText(context, fontSize: 12),
                fontWeight: FontWeight.w500,
                color: AppColor.main,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
