import 'package:note_application/constant/api_constant.dart';

class ApiNoteModel {
  final int id;
  String? title;
  String? content;
  String? image;
  String? password;
  final int idCategory;

  ApiNoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.password,
    required this.idCategory,
  });

  factory ApiNoteModel.fromJson(Map<String, dynamic> json) {
    return ApiNoteModel(
      id: json[ConstantNoteApi.id],
      title: json[ConstantNoteApi.title],
      content: json[ConstantNoteApi.content],
      image: json[ConstantNoteApi.image],
      password: json[ConstantNoteApi.password],
      idCategory: json[ConstantNoteApi.idCategory],
    );
  }

  Map<String, dynamic> categoryModelToJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ConstantNoteApi.title] = title;
    data[ConstantNoteApi.content] = content;
    data[ConstantNoteApi.image] = image;
    data[ConstantNoteApi.password] = password;
    data[ConstantNoteApi.idCategory] = idCategory;
    return data;
  }
}
