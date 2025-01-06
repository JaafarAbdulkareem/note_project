import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/function/respponsive_text_function.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
    required this.email,
    required this.onTap,
  });
  final String email;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            LanguageKeys.forgetPassword.tr(context),
            style: TextStyle(
              fontSize: getResponsiveText(context, fontSize: 12),
              fontWeight: FontWeight.w500,
              color: AppColor.main,
            ),
          ),
        ),
      ),
    );
  }
}
