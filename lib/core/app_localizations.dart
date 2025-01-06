import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_application/constant/lang_constant.dart';

class AppLocalizations {
  final Locale? locale;
  AppLocalizations({required this.locale});

  static AppLocalizations? of(BuildContext context) {
    // select the postiton in app's tree and declear customer localization
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationDelegate();

  late Map<String, String> _localizedString;
  Future loadJsonLanguage() async {
    String jsonString = await rootBundle
        .loadString("${ConstantLang.langPath}${locale!.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedString =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) => _localizedString[key] ?? "";
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ConstantLang.langs.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale: locale);
    await appLocalizations.loadJsonLanguage();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

