import 'package:note_application/constant/api_constant.dart';

class ApiCategoryModel {
  int? id;
  String? name;
  final String image;
  String? date;
  final String idUser;

  ApiCategoryModel( {
     this.id,
    required this.name,
    required this.image,
    required this.date,
    required this.idUser,
  });

  factory ApiCategoryModel.fromJson(Map<String, dynamic> json) {
    return ApiCategoryModel(
      id: json[ConstantCategoryApi.id],
      name: json[ConstantCategoryApi.categoryName],
      image: json[ConstantCategoryApi.image],
      date: json[ConstantCategoryApi.timeDate],
      idUser: json[ConstantCategoryApi.idUser],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ConstantCategoryApi.categoryName] = name;
    data[ConstantCategoryApi.image] = image;
    data[ConstantCategoryApi.timeDate] = date;
    data[ConstantCategoryApi.idUser] = idUser;
    return data;
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     ConstantCategoryApi.id: id,
  //     ConstantCategoryApi.categoryName: name,
  //     ConstantCategoryApi.image: image,
  //     ConstantCategoryApi.timeDate: date,
  //     ConstantCategoryApi.idUser: idUser,
  //   };
  // }
}
