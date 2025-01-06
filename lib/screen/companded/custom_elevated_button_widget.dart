import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/function/respponsive_text_function.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // autofocus: true,
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: getResponsiveText(context, fontSize: 45),
            color: AppColor.main,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getResponsiveText(context, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
