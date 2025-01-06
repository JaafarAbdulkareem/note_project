import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/password/password_cubit.dart';
import 'package:note_application/function/awesome_dialog/yes_no_function.dart';
import 'package:note_application/function/pincode/lock.dart';
import 'package:note_application/function/pincode/unlock.dart';

AwesomeDialog editAndDeletePinCode({
  required BuildContext context,
  required int index,
}) {
  return AwesomeDialog(
    context: context,
    btnOkText: LanguageKeys.edit.tr(context),
    btnOkOnPress: () {
      unlock(
        context: context,
        index: index,
        okOnPressed: () async {
          BlocProvider.of<PasswordCubit>(context).newPasswordMessage();
          await lock(
            context: context,
            index: index,
          ).show();
          if (!context.mounted) return;
          BlocProvider.of<PasswordCubit>(context).rePasswordMessage();
        },
      ).show();
      // await
    },
    btnCancelText: LanguageKeys.delete.tr(context),
    btnCancelOnPress: () {
      unlock(
        context: context,
        index: index,
        okOnPressed: () {
          yesAndNo(
            context: context,
            yesOnPress: () {
              BlocProvider.of<PasswordCubit>(context).dataPassword(null);
            },
          ).show();
        },
      ).show();
    },
  );
}
