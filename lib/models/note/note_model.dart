// import 'package:note_application/constant/api_constant.dart';

import 'package:note_application/models/note/api_note_model.dart';

class NoteModel {
  final int id;
  String? title;
  String? content;
  String? image;
  String? password;
  bool isSelected;
  final int idCategory;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    this.image,
    this.password,
    this.isSelected = false,
    required this.idCategory,
  });

  factory NoteModel.fromApiData({required ApiNoteModel apiNoteData}) {
    return NoteModel(
      id: apiNoteData.id,
      title: apiNoteData.title,
      content: apiNoteData.content,
      image: apiNoteData.image,
      password: apiNoteData.password,
      idCategory: apiNoteData.idCategory,
    );
  }

  // Map<String, dynamic> categoryModelToJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data[ConstantNoteApi.title] = title;
  //   data[ConstantNoteApi.content] = content;
  //   data[ConstantNoteApi.image] = image;
  //   data[ConstantNoteApi.password] = password;
  //   data[ConstantNoteApi.idCategory] = idCategory;
  //   return data;
  // }
}
