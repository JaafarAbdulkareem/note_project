import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/shared/customer_image_button_widget.dart';

class CustomTwoButtonWidget extends StatelessWidget {
  const CustomTwoButtonWidget({
    super.key,
    required this.textButton,
    this.color = AppColor.main,
    required this.onPressed,
  });
  final String textButton;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomerImageButtomWidget(
            title: LanguageKeys.cancel.tr(context),
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColor.error,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomerImageButtomWidget(
            title: textButton,
            onPressed: onPressed,
            color: color,
          ),
        ),
      ],
    );
  }
}
