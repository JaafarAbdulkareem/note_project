import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/data_center/data_center_cubit.dart';
import 'package:note_application/cubit/data_center/data_center_state.dart';
import 'package:note_application/function/flashbar_function.dart';
import 'package:note_application/screen/Auth/login/login_screen.dart';
import 'package:note_application/screen/category/home_category/home_category_screen.dart';
import 'package:note_application/screen/widget/custom_loading_initial_widget.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});
  static const String id = "Initial Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DataCenterCubit, DataCenterState>(
        listener: (context, state) {
          if (state is ErrorDataCenterState) {
            flashBar(
              title: LanguageKeys.errorTitle.tr(context),
              message: state.errorMessage.tr(context),
            ).show(context);
          }
        },
        builder: (context, state) {
          if (state is SuccessedDataCenterState) {
            return const HomeCategoryScreen();
          } else if (state is ErrorDataCenterState) {
            return const LoginScreen();
          } else if (state is LoadingDataCenterState) {
            return const CustomLoadingInitialWidget();
          }
          return const HomeCategoryScreen();
        },
      ),
    );
  }
}
