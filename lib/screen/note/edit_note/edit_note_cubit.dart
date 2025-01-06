import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/curd.dart';
import 'package:note_application/cubit/note/edit_note/edit_note_state.dart';
import 'package:note_application/cubit/note/note_choose_image/note_choose_image_cubit.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(InitialEditNoteState());
  int? indexEdit; //CustomListTitleWidget
  Curd curd = Curd();
  late String title;
  String? content, image;
  void editNoteData() {
    if (indexEdit != null) {
      emit(LoadingEditNoteState());
      NoteCenter.data[indexEdit!].title = title;
      NoteCenter.data[indexEdit!].content = content;
      _editToDatebase();
      // emit(SuccessedEditNoteState());
    } else {
      emit(ErrorEditNoteState(
          errorMessage: LanguageKeys.errorForUser));
    }
  }

  Future<void> _editToDatebase() async {
    if (NoteChooseImageCubit.imagePath == null) {
      emit(SuccessedEditNoteState());
      _postWithoutFile();
    } else {
      await _postWitFile();
      NoteChooseImageCubit.imagePath = null;
      emit(SuccessedEditNoteState());
    }
  }

  void _postWithoutFile() async {
    var response = await curd.postRequest(
      url: ConstantNoteApiPath.editNotePath,
      body: {
        ConstantNoteApi.id: NoteCenter.data[indexEdit!].id.toString(),
        ConstantNoteApi.title: title,
        ConstantNoteApi.content: content ?? "",
        ConstantNoteApi.image: image ?? "",
      },
    );
    if (response == null) {
      debugPrint(
          "${LanguageKeys.errorCatch} : NOTE EDIT : ${LanguageKeys.responseNull}");
      emit(ErrorEditNoteState(
          errorMessage: LanguageKeys.errorForUser));
    }
  }

  Future<void> _postWitFile() async {
    var response = await curd.postRequestWithFile(
      url: ConstantNoteApiPath.editNotePath,
      body: {
        ConstantNoteApi.id: NoteCenter.data[indexEdit!].id.toString(),
        ConstantNoteApi.title: title,
        ConstantNoteApi.content: content ?? "",
        ConstantNoteApi.image: image ?? "",
      },
      file: File(NoteChooseImageCubit.imagePath!),
    );
    Map<String, dynamic>? responseBody = _checkResponse(response);
    if (responseBody != null) {
      NoteCenter.data[indexEdit!].image = responseBody[ConstantNoteApi.image];
    } else {
      NoteCenter.data[indexEdit!].image = image;
    }
  }

  Map<String, dynamic>? _checkResponse(response) {
    if (response != null) {
      if (response[ConstantResultApi.status] == ConstantResultApi.success) {
        return response[ConstantResultApi.data];
      } else {
        return null;
      }
    } else {
      debugPrint(
          "${LanguageKeys.errorCatch} : NOTE EDIT : ${LanguageKeys.responseNull}");
    }
    return null;
  }
}
