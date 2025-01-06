import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';

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
  );
}
