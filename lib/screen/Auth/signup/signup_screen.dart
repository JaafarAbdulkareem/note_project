import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/function/flashbar_function.dart';
import 'package:note_application/function/awesome_dialog/go_email_function.dart';
import 'package:note_application/cubit/auth/auth_register_state.dart';
import 'package:note_application/cubit/auth/auth_signup_cubit.dart';
import 'package:note_application/screen/Auth/signup/signup_view.dart';
import 'package:note_application/screen/companded/customer_circular_progress_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static const String id = "Sign Up Screen";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSignupCubit, AuthRegisterState>(
      listener: (context, state) async {
        if (state is ErrorRegisterState) {
          if (!context.mounted) return;
          await flashBar(
            title: LanguageKeys.alertTitle.tr(context),
            message: state.errorMessage.tr(context),
          ).show(context);
        } else if (state is GoToEmailRegisterState) {
          if (!context.mounted) return;
          await goToEmail(context: context).show();
          if (!context.mounted) return;
          Navigator.pop(context);
        } else if (state is SuccessedRegisterState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is LoadingRegisterState) {
          return const CustomerCircularProgressWidget();
        }
        return const SignupView();
      },
    );
  }
}
