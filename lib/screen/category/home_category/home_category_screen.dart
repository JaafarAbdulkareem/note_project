import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/shared_preferenced_constant.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/category/add_category/add_category_cubit.dart';
import 'package:note_application/cubit/category/add_category/add_category_state.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
import 'package:note_application/cubit/category/category_choose_image/category_choose_image_cubit.dart';
import 'package:note_application/function/flashbar_function.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/screen/companded/customer_circular_progress_widget.dart';
import 'package:note_application/screen/widget/custom_category_build_widget.dart';
import 'package:note_application/screen/widget/custom_logout_button_widget.dart';

class HomeCategoryScreen extends StatefulWidget {
  const HomeCategoryScreen({super.key});
  static const String id = "Home Category Screen";

  @override
  State<HomeCategoryScreen> createState() => _HomeCategoryScreenState();
}

class _HomeCategoryScreenState extends State<HomeCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getResponsiveText(context, fontSize: 50),
        title: Text(
          '${LanguageKeys.hello.tr(context)} ${prefs!.getString(ConstantSharePreferences.username) ?? LanguageKeys.none.tr(context)}',
          style: TextStyle(
            fontSize: getResponsiveText(context, fontSize: 20),
          ),
        ),
        elevation: 4,
        actions: const [
          CustomLogoutButtonWidget(),
        ],
      ),
      body: BlocConsumer<AddCategoryCubit, AddCategoryState>(
        listener: (context, state) {
          if (state is SuccessedAddCategoryState) {
            Navigator.pop(context);
            CategoryChooseImageCubit.indexImage = null;
            CategoryCenterCubit.image = null;
            AddCategoryCubit.name = "";
          } else if (state is ErrorAddCategoryState) {
            flashBar(
              title: LanguageKeys.alertTitle.tr(context),
              message: state.errorMessage.tr(context),
            ).show(context);
          }
        },
        builder: (context, state) {
          if (state is SuccessedAddCategoryState) {
            return const CustomCategoryBuildWidget();
          } else if (state is LoadingAddCategoryState) {
            return const CustomerCircularProgressWidget();
          }
          return const CustomCategoryBuildWidget();
        },
      ),
    );
  }
}
