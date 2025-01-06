import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/shared_preferenced_constant.dart';
import 'package:note_application/cubit/auth/auth_register_state.dart';

class AuthSignupCubit extends Cubit<AuthRegisterState> {
  AuthSignupCubit() : super(InitialRegisterState());

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      emit(LoadingRegisterState());
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await auth.currentUser!.updateDisplayName(username);
      if (!auth.currentUser!.emailVerified) {
        emit(GoToEmailRegisterState());
      } else {
        emit(SuccessedRegisterState());
      }
      prefs!.setString(ConstantSharePreferences.id, auth.currentUser!.uid);
      prefs!.setString(ConstantSharePreferences.username, username);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(ErrorRegisterState(
            errorMessage: LanguageKeys.alertWeakPassword));
      } else if (e.code == 'email-already-in-use') {
        emit(ErrorRegisterState(
            errorMessage: LanguageKeys.alertEmailExists));
      } else {
        emit(ErrorRegisterState(errorMessage: LanguageKeys.errorForUser));
        // emit(ErrorRegisterState(errorMessage: e.code));
      }
    } catch (e) {
      debugPrint("${LanguageKeys.errorCatch} : SIGN UP : $e");
      emit(ErrorRegisterState(
          errorMessage: LanguageKeys.errorForUser));
    }
  }
}
