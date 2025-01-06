import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/shared_preferenced_constant.dart';
import 'package:note_application/core/curd.dart';
import 'package:note_application/cubit/category/add_category/add_category_state.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
import 'package:note_application/function/date_time_function.dart';
import 'package:note_application/models/category/api_category_model.dart';
import 'package:note_application/models/category/category_model.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> with Curd {
  AddCategoryCubit() : super(InitialAddCategoryState());
  static late String name;

  String date = dateTimeFrame(DateTime.now());
  Future<void> addCategoryData() async {
    emit(LoadingAddCategoryState());
    int? lastID = await _addToDatabase();

    if (lastID != null) {
      _addToList(lastID);
      emit(SuccessedAddCategoryState());
    }
  }

  void _addToList(int id) {
    CategoryModel newDate = CategoryModel(
      id: id,
      name: name,
      image: CategoryCenterCubit.image,
      date: date,
    );
    // CategoryCenterCubit.data.add(newDate);
    CategoryCenterCubit.data.insert(0, newDate);
  }

  Future<int?> _addToDatabase() async {
    ApiCategoryModel category = ApiCategoryModel(
      name: name,
      image: CategoryCenterCubit.image!,
      date: date,
      idUser: prefs!.getString(ConstantSharePreferences.id).toString(),
    );
    Map<String, dynamic> body = category.toJson();
    var response = await postRequest(
      url: ConstantCategoryApiPath.insertCategoryPath,
      body: body,
    );
    if (response != null) {
      if (response[ConstantResultApi.status] == ConstantResultApi.success) {
        return int.parse(
            response[ConstantResultApi.data][ConstantCategoryApi.id]);
      } else {
        emit(ErrorAddCategoryState(errorMessage: LanguageKeys.errorForUser));
      }
    } else {
      debugPrint(
          "${LanguageKeys.errorCatch} : CATEGORY ADD : ${LanguageKeys.responseNull}");
      emit(ErrorAddCategoryState(errorMessage: LanguageKeys.errorForUser));
    }
    return null;
  }
}
