import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/curd.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
import 'package:note_application/cubit/note/add_note/add_note_state.dart';
import 'package:note_application/cubit/note/note_choose_image/note_choose_image_cubit.dart';
import 'package:note_application/models/note/note_model.dart';
import 'package:path/path.dart';

class AddNoteCubit extends Cubit<AddNoteState> with Curd {
  AddNoteCubit() : super(InitialAddNoteState());

  // String? image;//

  void addNoteData(BuildContext context, String title, String content) async {
    String? imagePath = NoteChooseImageCubit.imagePath;
    emit(LoadingAddNoteState());
    if (imagePath == null) {
      await _postWithoutFile(title, content);
    } else {
      await _postWithFile(title, content, imagePath);
      // imagePath = null;
    }
    if (!context.mounted) return;
    BlocProvider.of<CategoryCenterCubit>(context)
        .changeNoteNumber(NoteCenter.index!, NoteCenter.data.length);
  }

  _postWithoutFile(String title, String content) async {
    Map<String, dynamic>? responseBody;
    NoteModel newData;
    var response = await postRequest(
      url: ConstantNoteApiPath.insertNotePath,
      body: {
        ConstantNoteApi.title: title,
        ConstantNoteApi.content: content,
        ConstantNoteApi.image: "",
        ConstantNoteApi.idCategory: NoteCenter.idCategory.toString(),
      },
    );
    responseBody = _checkResponse(response);
    if (responseBody != null) {
      newData = NoteModel(
        id: _convertToint(responseBody[ConstantNoteApi.id]),
        title: title,
        content: content,
        // image: image,
        idCategory: NoteCenter.idCategory,
      );
      // NoteCenter.data.add(newData);
      NoteCenter.data.insert(0, newData);
      emit(SuccessedAddNoteState());
    } else {
      emit(ErrorAddNoteState(errorMessage: LanguageKeys.errorForUser));
    }
  }

  _postWithFile(String title, String content, String imagePath) async {
    // int? idNote;
    Map<String, dynamic>? responseBody;
    NoteModel newData;
    String image = basename(imagePath);
    var response = await postRequestWithFile(
      url: ConstantNoteApiPath.insertNotePath,
      body: {
        ConstantNoteApi.title: title,
        ConstantNoteApi.content: content,
        ConstantNoteApi.image: image,
        ConstantNoteApi.idCategory: NoteCenter.idCategory.toString(),
      },
      file: File(imagePath),
    );
    responseBody = _checkResponse(response);
    if (responseBody != null) {
      newData = NoteModel(
        id: _convertToint(responseBody[ConstantNoteApi.id]),
        title: title,
        content: content,
        image: responseBody[ConstantNoteApi.image],
        idCategory: NoteCenter.idCategory,
      );
      // NoteCenter.data.add(newData);
      NoteCenter.data.insert(0, newData);
      emit(SuccessedAddNoteState());
    } else {
      emit(ErrorAddNoteState(errorMessage: LanguageKeys.errorForUser));
    }
  }

  // int?
  Map<String, dynamic>? _checkResponse(response) {
    if (response != null) {
      if (response[ConstantResultApi.status] == ConstantResultApi.success) {
        return response[ConstantResultApi.data];
      }
      // if (response[ConstantResultApi.status] == ConstantResultApi.success) {
      //   return int.parse(response[ConstantResultApi.data][ConstantNoteApi.id]);
      // }
      else {
        return null;
      }
    } else {
      debugPrint(
          "${LanguageKeys.errorCatch} : NOTE ADD : ${LanguageKeys.responseNull}");
    }
    return null;
  }
}

int _convertToint(String id) {
  return int.parse(id);
}
