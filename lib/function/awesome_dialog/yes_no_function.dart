import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/function/respponsive_text_function.dart';

AwesomeDialog yesAndNo({
  required BuildContext context,
  required VoidCallback yesOnPress,
}) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    desc: LanguageKeys.delete.tr(context),
    btnOkText: LanguageKeys.no.tr(context),
    btnOkOnPress: () {},
    btnCancelText: LanguageKeys.yes.tr(context),
    btnCancelOnPress: yesOnPress,
    descTextStyle: TextStyle(
      fontSize: getResponsiveText(context, fontSize: 20)
    ),
    buttonsTextStyle: TextStyle(
      fontSize: getResponsiveText(context, fontSize: 14),
      color: TextColor.buttonText
    ),
  );
}
