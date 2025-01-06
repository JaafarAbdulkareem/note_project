import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';

AwesomeDialog goToEmail({
  required BuildContext context,
}) {
  FirebaseAuth.instance.currentUser!.sendEmailVerification();
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    btnOkOnPress: () {
      // go to  email
    },
    btnCancelOnPress: () {},
    title: LanguageKeys.verification.tr(context),
  );
}

//  await AwesomeDialog(
//           context: context,
//           dialogType: DialogType.info,
//           animType: AnimType.rightSlide,
//           btnOkText: "Resend Verification",
//           btnOkOnPress: () async {
//             await FirebaseAuth.instance.currentUser!.sendEmailVerification();
//             // go to  email
//           },
//           btnCancelText: "Back",
//           btnCancelOnPress: () {},
//           title: LanguageKeys.verification,
//         ).show();