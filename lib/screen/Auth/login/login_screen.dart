import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/data_center/data_center_cubit.dart';
import 'package:note_application/function/flashbar_function.dart';
import 'package:note_application/function/awesome_dialog/go_email_function.dart';
import 'package:note_application/cubit/auth/auth_login_cubit.dart';
import 'package:note_application/cubit/auth/auth_register_state.dart';
import 'package:note_application/screen/Auth/login/login_view.dart';
import 'package:note_application/screen/companded/customer_circular_progress_widget.dart';
import 'package:note_application/screen/initial_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String id = "Login Screen";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthLoginCubit, AuthRegisterState>(
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
        }
      },
      builder: (context, state) {
        // if (state is InitialRegisterState) {
        //   BlocProvider.of<DataCenterCubit>(context).postAppData();
        // } else 
        if (state is GoogleNullRegisterState) {
          return const LoginView();
        } else if (state is LoadingRegisterState) {
          return const CustomerCircularProgressWidget();
        } else if (state is SuccessedRegisterState) {
          // DataCenterCubit.dataCenter.clear();
          // BlocProvider.of<DataCenterCubit>(context).postAppData();
          return const InitialScreen();
        }
        return const LoginView();
      },
    );
  }
}
