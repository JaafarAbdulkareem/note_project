import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_application/constant/icon_constant.dart';
import 'package:note_application/cubit/auth/auth_login_cubit.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/screen/Auth/login/login_screen.dart';

class CustomLogoutButtonWidget extends StatelessWidget {
  const CustomLogoutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _logout(context);
      },
      child: Icon(
        ConstantIcon.logout,
        size: getResponsiveText(context, fontSize: 24),
      ),
    );
  }

  void _logout(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      if (user.providerData
          .any((provider) => provider.providerId == 'google.com')) {
        await GoogleSignIn().signOut();
      }

      await FirebaseAuth.instance.signOut();

      // await FirebaseAuth.instance.signOut();
      // await GoogleSignIn().signOut();
      if (!context.mounted) return;
      BlocProvider.of<AuthLoginCubit>(context).logout();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
    }
  }
}
