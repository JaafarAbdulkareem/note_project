import 'package:another_flushbar/flushbar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/app_snack_bar.dart';
import 'package:note_application/class/awesome_dialog.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/password/password_cubit.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/screen/companded/custom_two_buttom_widget.dart';
import 'package:note_application/screen/note/display_note/display_note_screen.dart';
import 'package:note_application/screen/widget/custom_unlock_pincode_widget.dart';

AwesomeDialog unlock({
  required BuildContext context,
  required int index,
  required VoidCallback okOnPressed,
}) {
  String? password;
  BlocProvider.of<PasswordCubit>(context).indexPassword = index;
  return AwesomeDialog(
    animType: AppAwesomeDialog.animType,
    dialogBorderRadius: BorderRadius.all(
        Radius.circular(getResponsiveText(context, fontSize: 50))),
    headerAnimationLoop: AppAwesomeDialog.headerAnimationLoop,
    dismissOnTouchOutside: AppAwesomeDialog.dismissOnTouchOutside,
    showCloseIcon: AppAwesomeDialog.showCloseIcon,
    dialogType: AppAwesomeDialog.dialogType,
    padding: EdgeInsets.symmetric(
        horizontal: getResponsiveText(context, fontSize: 26)),
    context: context,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          LanguageKeys.password.tr(context),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveText(context, fontSize: 18),
          ),
        ),
        CustomUnlockPincodeWidget(
          onCompleted: (value) {
            password = value;
          },
        ),
        CustomTwoButtonWidget(
          textButton: LanguageKeys.ok.tr(context),
          color: AppColor.ok,
          onPressed: () {
            if (password == null) {
              Flushbar(
                duration: AppSnackBar.duration,
                backgroundGradient: AppSnackBar.backgroundColor,
                message: LanguageKeys.noFilled.tr(context),
                messageSize: AppSnackBar.messageSize,
                flushbarPosition: AppSnackBar.direction,
                messageColor: AppSnackBar.messageColor,
              ).show(context);
            } else {
              if (NoteCenter.data[index].password == password) {
                Navigator.pop(context);
                // test(context, index);
                okOnPressed();
              } else {
                Navigator.pop(context);
                Flushbar(
                  duration: AppSnackBar.duration,
                  backgroundGradient: AppSnackBar.backgroundColor,
                  message: LanguageKeys.wrong.tr(context),
                  messageSize: AppSnackBar.messageSize,
                  flushbarPosition: AppSnackBar.direction,
                  messageColor: AppSnackBar.messageColor,
                ).show(context);
              }
            }
            // _okOnPressed(
            //   context,
            //   index,
            //   password,
            // );
          },
        ),
      ],
    ),
    borderSide: const BorderSide(width: 1),
  );
}

void test(BuildContext context, int index) {
  Navigator.of(context).pushNamed(
    DisplayNoteScreen.id,
    arguments: NoteCenter.data[index],
  );
}

// void _okOnPressed(
//   BuildContext context,
//   int index,
//   String? password,
// ) {}
