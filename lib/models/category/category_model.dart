// import 'package:note_application/constant/api_constant.dart';

import 'package:note_application/models/category/api_category_model.dart';
import 'package:note_application/models/note/note_model.dart';

class CategoryModel {
  final int id;
  String? name;
  String? image;
  String? date;
  int noNote;
  List<NoteModel> listNote;

  CategoryModel({
    required this.id,
    this.name,
    this.image,
    this.date,
    this.noNote = 0,
    List<NoteModel>? listNote,
  }) : listNote = listNote ?? [];
  
  factory CategoryModel.fromApiData(
      {required ApiCategoryModel apiCategoryData}) {
    return CategoryModel(
      id: apiCategoryData.id!,
      name: apiCategoryData.name,
      image: apiCategoryData.image,
      date: apiCategoryData.date,
    );
  }

//   Map<String, dynamic> categoryModelToJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = this.name;
//     data['age'] = this.age;
//     data['car'] = this.car;
//     data['age'] = this.age;
//     data['car'] = this.car;
//     return data;
//   }
}
