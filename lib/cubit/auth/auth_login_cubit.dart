import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/shared_preferenced_constant.dart';
import 'package:note_application/cubit/auth/auth_register_state.dart';

class AuthLoginCubit extends Cubit<AuthRegisterState> {
  AuthLoginCubit() : super(InitialRegisterState());

////<<<<<<<<<<<<<<< logout >>>>>>>>>>>>>>>>>>>

  void logout() async {
    emit(InitialRegisterState());
  }

  ////<<<<<<<<<<<<<<< login >>>>>>>>>>>>>>>>>>>

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoadingRegisterState());
      final FirebaseAuth auth = FirebaseAuth.instance;
      var x = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (auth.currentUser != null && auth.currentUser!.emailVerified) {
        prefs!.setString(ConstantSharePreferences.id, x.user!.uid);
        prefs!
            .setString(ConstantSharePreferences.username, x.user!.displayName!);

        emit(SuccessedRegisterState());
      } else if (!auth.currentUser!.emailVerified) {
        emit(GoToEmailRegisterState());
      } else {
        emit(ErrorRegisterState(errorMessage: LanguageKeys.alertEmailNotFound));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        emit(ErrorRegisterState(errorMessage: LanguageKeys.alertWrongPassword));
      } else if (e.code == 'invalid-email') {
        emit(ErrorRegisterState(errorMessage: LanguageKeys.alertEmailPassword));
        // emit(ErrorRegisterState(errorMessage: LanguageKeys.alertEmailInvalid));
      } else {
        // } else {
        emit(ErrorRegisterState(errorMessage: LanguageKeys.alertEmailPassword));
      }
    } catch (e) {
      debugPrint("${LanguageKeys.errorCatch} : LOG IN : $e");
      emit(ErrorRegisterState(errorMessage: LanguageKeys.errorForUser));
    }
  }

// <<<<<<<<<<<<<< login with google >>>>>>>>>>>>>>>

  Future<void> loginWithGoogle() async {
    try {
      emit(LoadingRegisterState());
      final FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      emit(GoogleNullRegisterState());
      if (googleAuth != null) {
        emit(LoadingRegisterState());
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        userCredential.user!.uid;
        prefs!.setString(ConstantSharePreferences.id, userCredential.user!.uid);
        prefs!.setString(ConstantSharePreferences.username,
            userCredential.user!.displayName!);

        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          emit(SuccessedRegisterState());
        } else {
          emit(GoToEmailRegisterState());
        }
      }
    } on PlatformException catch (_) {
      emit(ErrorRegisterState(errorMessage: LanguageKeys.errorForUser));
      // emit(ErrorRegisterState(errorMessage: e.code));
    } catch (e) {
      debugPrint("${LanguageKeys.errorCatch} : LOGIN GOOGLE : $e");
      emit(ErrorRegisterState(errorMessage: LanguageKeys.errorForUser));
    }
  }
}
