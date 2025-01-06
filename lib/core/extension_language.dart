import 'package:flutter/material.dart';
import 'package:note_application/core/app_localizations.dart';

extension TranslateX on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}
