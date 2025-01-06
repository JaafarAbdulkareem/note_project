import 'package:flutter/material.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';

String? validatorGeneral(BuildContext context,
    {required String value, @required int? min, @required int? max}) {
  if (value.trim().isEmpty) {
    return LanguageKeys.empty.tr(context);
  } else {
    if (value.length < min!) {
      return LanguageKeys.min.tr(context) + min.toString();
    } else if (value.length > max!) {
      return LanguageKeys.max.tr(context) + max.toString();
    }
    return null;
  }
}

String? validatorCategory(BuildContext context, String? value) {
  if (value == null || value.trim().isEmpty) {
    return LanguageKeys.empty.tr(context);
  }
  if (CategoryCenterCubit.image == null) {
    return LanguageKeys.image.tr(context);
  }
  return null;
}
