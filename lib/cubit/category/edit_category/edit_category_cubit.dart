import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/curd.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
import 'package:note_application/cubit/category/edit_category/edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> with Curd {
  EditCategoryCubit() : super(InitialEditCategoryState());
  static int? indexEdit;
  static String? name;
  static String? date = CategoryCenterCubit.data[indexEdit!].date;
  String renameEditCategory() {
    return CategoryCenterCubit.data[indexEdit!].name!;
  }

  Future<void> editCategoryData() async {
    emit(LoadingEditCategoryState());
    if (indexEdit != null) {
      CategoryCenterCubit.data[indexEdit!].name = name;
      CategoryCenterCubit.data[indexEdit!].image = CategoryCenterCubit.image;
      CategoryCenterCubit.data[indexEdit!].date = date;
      _editToDatebase(name!, date!);
      // emit(SuccessedEditCategoryState());
    }
  }

  Future<void> _editToDatebase(String name, String date) async {
    var response = await postRequest(
      url: ConstantCategoryApiPath.editCategoryPath,
      body: {
        ConstantCategoryApi.id:
            CategoryCenterCubit.data[indexEdit!].id.toString(),
        ConstantCategoryApi.categoryName: name,
        ConstantCategoryApi.image: CategoryCenterCubit.image,
        ConstantCategoryApi.timeDate: date,
      },
    );
    if (response != null) {
      // if (response[ConstantResultApi.status] == ConstantResultApi.success) {
      // } else {
      //   // emit(ErrorEditCategoryState(
      //   //     errorMessage: LanguageKeys.errorForUser));
      // }
      emit(SuccessedEditCategoryState());
    } else {
      debugPrint(
          "${LanguageKeys.errorCatch} : CATEGORY EDIT : ${LanguageKeys.responseNull}");
      emit(ErrorEditCategoryState(errorMessage: LanguageKeys.errorForUser));
    }
  }
}
