import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/curd.dart';
import 'package:note_application/cubit/password/password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(InitialPasswordState());
  Curd curd = Curd();
  int? indexPassword;

  void newPasswordMessage() {
    emit(MessageNewPasswordState());
  }

  void rePasswordMessage() {
    emit(SuccessedRepasswordState());
  }

  void dataPassword(String? password) {
    if (indexPassword != null) {
      emit(LoadingPasswordState());
      NoteCenter.data[indexPassword!].password = password;
      emit(RefreshPasswordState());
      _passwordToDatabase(
        NoteCenter.data[indexPassword!].id.toString(),
        password,
      );
    }
  }

  Future<void> _passwordToDatabase(String id, String? password) async {
    var response =
        await curd.postRequest(url: ConstantNoteApiPath.passwordPath, body: {
      ConstantNoteApi.id: id,
      ConstantNoteApi.password: password ?? "",
    });
    if (response != null) {
      if (response[ConstantResultApi.data] == ConstantResultApi.fail) {
        emit(ErrorPasswordState(
            errorMessage: LanguageKeys.errorForUser));
      }
    } else {
      emit(ErrorPasswordState(
          errorMessage: LanguageKeys.errorForUser));
    }
  }
}
