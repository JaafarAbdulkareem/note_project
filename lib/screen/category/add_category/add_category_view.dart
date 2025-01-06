import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/category/add_category/add_category_cubit.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
import 'package:note_application/cubit/category/category_choose_image/category_choose_image_cubit.dart';
import 'package:note_application/cubit/category/category_choose_image/category_choose_image_state.dart';
import 'package:note_application/function/validation_function.dart';
import 'package:note_application/screen/widget/custom_image_list_widget.dart';
import 'package:note_application/shared/customer_image_button_widget.dart';
import 'package:note_application/shared/customer_text_field_widget.dart';

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({
    super.key,
  });

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  final TextEditingController _categoryController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    super.dispose();
    _categoryController.dispose();
    CategoryChooseImageCubit.indexImage = null;
    CategoryCenterCubit.image = null;
    AddCategoryCubit.name = "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Padding(
        padding: EdgeInsets.only(
          right: 12,
          left: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom + 4,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 25),
              CustomerFormFieldWidget(
                hint: LanguageKeys.addCategoryHint.tr(context),
                onSaved: (value) async {
                  AddCategoryCubit.name = value!;
                  BlocProvider.of<AddCategoryCubit>(context).addCategoryData();
                },
                validator: (value) => validatorCategory(context, value),
                controller: _categoryController,
              ),
              const AspectRatio(
                aspectRatio: 2 / 1,
                child: CustomImageListWidget(),
              ),
              BlocListener<CategoryChooseImageCubit, CategoryChooseImageState>(
                listener: (context, state) {
                  _autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                },
                child: CustomerImageButtomWidget(
                  title: LanguageKeys.add.tr(context),
                  color: AppColor.main,
                  onPressed: _onPressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      _autoValidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
