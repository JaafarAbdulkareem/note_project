import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';

class AppSnackBar {
  static const Duration duration = Duration(seconds: 2);
  static const LinearGradient backgroundColor = LinearGradient(
    colors: [
      AppColor.main,
      AppColor.main,
      AppColor.error,
      // Colors.pink,
    ],
  );
  static const Color messageColor = Colors.black;
  static const double messageSize = 16;
  static const FlushbarPosition direction = FlushbarPosition.TOP;
}
