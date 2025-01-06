import 'package:flutter/material.dart';
import 'package:note_application/class/pin_code.dart';
import 'package:note_application/constant/size_constant.dart';
import 'package:note_application/constant/string_constant.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomLockPincodeWidget extends StatelessWidget {
  const CustomLockPincodeWidget({
    super.key,
    required this.onCompleted,
  });
  final Function(String?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      obscuringCharacter: ConstantString.lock,
      length: ConstantPinCode.length,
      obscureText: AppPinCode.obscureText,
      keyboardType: AppPinCode.keyboardType,
      animationType: AppPinCode.animationType,
      pinTheme: AppPinCode.customPinTheme(context),
      onCompleted: onCompleted,
    );
  }
}
