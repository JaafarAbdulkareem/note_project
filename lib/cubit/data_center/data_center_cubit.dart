import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/shared_preferenced_constant.dart';
import 'package:note_application/core/curd.dart';
import 'package:note_application/cubit/data_center/data_center_state.dart';
import 'package:note_application/models/category/api_category_model.dart';
import 'package:note_application/models/category/category_model.dart';
import 'package:note_application/models/note/api_note_model.dart';
import 'package:note_application/models/note/note_model.dart';

class DataCenterCubit extends Cubit<DataCenterState> with Curd {
  DataCenterCubit() : super(InitialDataCenterState());

  static List<CategoryModel> dataCenter = [];

  Future<void> postAppData() async {
    dataCenter.clear();
    emit(LoadingDataCenterState());
    List<ApiCategoryModel> apiCategoryData = await _getCategoryDataApi();

    List<ApiNoteModel> apiNoteData;
    List<NoteModel> noteData = [];
    for (int i = 0; i < apiCategoryData.length; i++) {
      dataCenter.add(
        CategoryModel.fromApiData(
          apiCategoryData: apiCategoryData[i],
        ),
      );
      apiNoteData =
          await _getNoteDataApi(indexCategory: apiCategoryData[i].id!);
      for (ApiNoteModel elementNote in apiNoteData) {
        if (elementNote.idCategory == apiCategoryData[i].id) {
          noteData.add(
            NoteModel.fromApiData(
              apiNoteData: elementNote,
            ),
          );
        }
      }
      dataCenter[i].listNote =  List.from(noteData);
      dataCenter[i].noNote = noteData.length;
      noteData.clear();
    }
    // await Future.delayed(const Duration(seconds: 4));
    emit(SuccessedDataCenterState());
  }

  Future<List<ApiCategoryModel>> _getCategoryDataApi() async {
    List<ApiCategoryModel> data = [];
    var response = await postRequest(
      url: ConstantCategoryApiPath.displayCategoryPath,
      body: {
        ConstantCategoryApi.idUser:
            prefs!.getString(ConstantSharePreferences.id),
      },
    );

    if (response != null) {
      if (response[ConstantResultApi.status] == ConstantResultApi.success) {
        for (Map<String, dynamic> element in response[ConstantResultApi.data]) {
          data.add(ApiCategoryModel.fromJson(element));
        }
        return data;
      } else {
        return [];
      }
    } else {
      emit(
        ErrorDataCenterState(
          errorMessage: LanguageKeys.errorForUser,
        ),
      );
      debugPrint(
          "${LanguageKeys.errorCatch} : Initial CATEGORY : ${LanguageKeys.responseNull}");
      return [];
    }
  }

  Future<List<ApiNoteModel>> _getNoteDataApi(
      {required int indexCategory}) async {
    List<ApiNoteModel> data = [];
    var response = await postRequest(
      url: ConstantNoteApiPath.displayNotePath,
      body: {
        ConstantNoteApi.idCategory: indexCategory.toString(),
      },
    );

    if (response != null) {
      if (response[ConstantResultApi.status] == ConstantResultApi.success) {
        for (Map<String, dynamic> element in response[ConstantResultApi.data]) {
          data.add(ApiNoteModel.fromJson(element));
        }
        return data;
      } else {
        return [];
      }
    } else {
      emit(
        ErrorDataCenterState(
          errorMessage: LanguageKeys.errorForUser,
        ),
      );
      debugPrint(
          "${LanguageKeys.errorCatch} : Initial NOTE : ${LanguageKeys.responseNull}");
      return [];
    }
  }
}
