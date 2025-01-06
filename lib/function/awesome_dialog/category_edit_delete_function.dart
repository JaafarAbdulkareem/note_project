import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/curd.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
import 'package:note_application/function/awesome_dialog/yes_no_function.dart';
import 'package:note_application/function/flashbar_function.dart';
import 'package:note_application/screen/category/edit_category/edit_category_screen.dart';
import 'package:note_application/screen/category/home_category/home_category_screen.dart';

AwesomeDialog categoryEditAndDeleteDialog({
  required BuildContext context,
  required int indexDelete,
}) {
  return AwesomeDialog(
    context: context,
    btnOkText: LanguageKeys.edit.tr(context),
    btnOkOnPress: () {
      Navigator.pushNamed(context, EditCategoryScreen.id);
    },
    btnCancelText: LanguageKeys.delete.tr(context),
    btnCancelOnPress: () {
      yesAndNo(
        context: context,
        yesOnPress: () {
          _deleteCategoryList(context, indexDelete);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HomeCategoryScreen.id, (route) => false);
        },
      ).show();
    },
  );
}

void _deleteCategoryList(BuildContext context, int indexDelete) {
  int idToDatabase = CategoryCenterCubit.data[indexDelete].id;
  CategoryCenterCubit.data.removeAt(indexDelete);
  _deleteToDatabase(context, idToDatabase);
}

Future<void> _deleteToDatabase(BuildContext context, int idToDatabase) async {
  var response = await Curd().postRequest(
    url: ConstantCategoryApiPath.deleteCategoryPath,
    body: {
      ConstantCategoryApi.id: idToDatabase.toString(),
    },
  );

  if (response != null) {
    if (response[ConstantResultApi.status] == ConstantResultApi.success) {
    } else {
      if (!context.mounted) return;
      flashBar(
        title: LanguageKeys.alertTitle.tr(context),
        message: LanguageKeys.errorForUser.tr(context),
      ).show(context);
    }
  } else {
    if (!context.mounted) return;
    flashBar(
      title: LanguageKeys.alertTitle.tr(context),
      message: LanguageKeys.errorForUser.tr(context),
    ).show(context);
    debugPrint(
        "${LanguageKeys.errorCatch} : CATEGORY DELETE : ${LanguageKeys.responseNull}");
  }
}
