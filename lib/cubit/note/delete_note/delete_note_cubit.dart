import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/curd.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
import 'package:note_application/cubit/note/delete_note/delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(RefreshDeleteNoteState());
  Curd curd = Curd();

  void deleteNote(BuildContext context, int index) {
    emit(LoadingDeleteNoteState());
    if (index != -1) // -1 No index
    {
      String idNote = NoteCenter.data[index].id.toString();
      String? imageNote = NoteCenter.data[index].image;

      _deleteNoteList(index);
      emit(RefreshDeleteNoteState());
      _deleteToDatabase(idNote, imageNote ?? "");
      BlocProvider.of<CategoryCenterCubit>(context)
          .changeNoteNumber(NoteCenter.index!, NoteCenter.data.length);
    } else {
      emit(ErrorDeleteNoteState(
          errorMessage: LanguageKeys.errorForUser));
    }
  }

  void _deleteNoteList(int index) {
    NoteCenter.data.removeAt(index);
  }

  void _deleteToDatabase(String idNote, String imageNote) async {
    var response = await curd.postRequest(
      url: ConstantNoteApiPath.deleteNotePath,
      body: {
        ConstantNoteApi.id: idNote,
        ConstantNoteApi.image: imageNote,
      },
    );

    if (response != null) {
      if (response[ConstantResultApi.status] == ConstantResultApi.success) {
        // emit(SuccessedDeleteNoteState());
      } else {
        emit(ErrorDeleteNoteState(
            errorMessage: LanguageKeys.errorForUser));
      }
    } else {
      emit(ErrorDeleteNoteState(
          errorMessage: LanguageKeys.errorForUser));
      debugPrint(
          "${LanguageKeys.errorCatch} : NOTE DELETE : ${LanguageKeys.responseNull}");
    }
  }
}
