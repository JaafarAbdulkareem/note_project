import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppPinCode {
  static const bool obscureText = true;
  static const TextInputType keyboardType = TextInputType.number;
  static const AnimationType animationType = AnimationType.slide;
  static PinTheme customPinTheme(BuildContext context) {
    return PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius:
          BorderRadius.circular(getResponsiveText(context, fontSize: 20)),
      fieldHeight: getResponsiveText(context, fontSize: 40),
      fieldWidth: getResponsiveText(context, fontSize: 30),
      activeColor: PinCodeColor.activeColor,
      inactiveColor: PinCodeColor.inactiveColor,
      inactiveFillColor: PinCodeColor.inactiveFillColor,
      selectedColor: PinCodeColor.selectedColor,
      activeFillColor: PinCodeColor.activeFillColor,
    );
  }
}
