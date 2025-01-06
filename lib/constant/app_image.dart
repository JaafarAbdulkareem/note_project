import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/map_constant.dart';

const String _pathImage = "assets/images/";

class AppImage {
  static const String note = "${_pathImage}note.png";
  static const String auth = "${_pathImage}login.png";
  static const String google = "${_pathImage}google.png";
  static const String addCategory = "${_pathImage}addCategory.png";
  static const String edit = "${_pathImage}edit.png";
  static const String addNote = "${_pathImage}addNote.png";
  static const String addImage = "${_pathImage}addImage.png";
  static const String logo = "${_pathImage}logo.png";
  static const String empty = "${_pathImage}empty.png";
}

class AppListImage {
  static const List<Map<String, String>> imageCategory = [
    {
      ConstantMapImage.image: "${_pathImage}folder.png",
      ConstantMapImage.title: LanguageKeys.folder,
    },
    {
      ConstantMapImage.image: "${_pathImage}food.png",
      ConstantMapImage.title: LanguageKeys.food,
    },
    {
      ConstantMapImage.image: "${_pathImage}certificate.png",
      ConstantMapImage.title: LanguageKeys.certificate,
    },
    {
      ConstantMapImage.image: "${_pathImage}health.png",
      ConstantMapImage.title: LanguageKeys.health,
    },
    {
      ConstantMapImage.image: "${_pathImage}eduction.png",
      ConstantMapImage.title: LanguageKeys.education,
    },
    {
      ConstantMapImage.image: "${_pathImage}fire.png",
      ConstantMapImage.title: LanguageKeys.fire,
    },
    {
      ConstantMapImage.image: "${_pathImage}energy.png",
      ConstantMapImage.title: LanguageKeys.energy,
    },
    {
      ConstantMapImage.image: "${_pathImage}sport.png",
      ConstantMapImage.title: LanguageKeys.sport,
    },
    {
      ConstantMapImage.image: "${_pathImage}money.png",
      ConstantMapImage.title: LanguageKeys.money,
    },
    {
      ConstantMapImage.image: "${_pathImage}ai.png",
      ConstantMapImage.title: LanguageKeys.ai,
    },
    {
      ConstantMapImage.image: "${_pathImage}baby.png",
      ConstantMapImage.title: LanguageKeys.baby,
    },
    {
      ConstantMapImage.image: "${_pathImage}baird.png",
      ConstantMapImage.title: LanguageKeys.baird,
    },
    {
      ConstantMapImage.image: "${_pathImage}butterfly.png",
      ConstantMapImage.title: LanguageKeys.butterfly,
    },
    {
      ConstantMapImage.image: "${_pathImage}diamond.png",
      ConstantMapImage.title: LanguageKeys.diamond,
    },
    {
      ConstantMapImage.image: "${_pathImage}dice.png",
      ConstantMapImage.title: LanguageKeys.dice,
    },
    {
      ConstantMapImage.image: "${_pathImage}fruit.png",
      ConstantMapImage.title: LanguageKeys.fruit,
    },
    {
      ConstantMapImage.image: "${_pathImage}lion.png",
      ConstantMapImage.title: LanguageKeys.lion,
    },
    {
      ConstantMapImage.image: "${_pathImage}rose.png",
      ConstantMapImage.title: LanguageKeys.rose,
    },
    {
      ConstantMapImage.image: "${_pathImage}spiderman.png",
      ConstantMapImage.title: LanguageKeys.spiderMan,
    },
    {
      ConstantMapImage.image: "${_pathImage}whatsapp.png",
      ConstantMapImage.title: LanguageKeys.whatsapp,
    },
  ];
}
