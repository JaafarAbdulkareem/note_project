import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/app_image.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
import 'package:note_application/cubit/category/edit_category/edit_category_cubit.dart';
import 'package:note_application/cubit/change_date/change_date_cubit.dart';
import 'package:note_application/cubit/change_date/change_date_state.dart';
import 'package:note_application/cubit/category/category_choose_image/category_choose_image_cubit.dart';
import 'package:note_application/function/date_time_function.dart';
import 'package:note_application/function/get_index_image_function.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/screen/companded/custom_two_buttom_widget.dart';
import 'package:note_application/screen/widget/custom_image_list_widget.dart';
import 'package:note_application/shared/customer_text_field_widget.dart';

class EditCategoryScreen extends StatefulWidget {
  static const String id = "Edit Category Screen";
  const EditCategoryScreen({
    super.key,
  });

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  String? image, dateTime;
  @override
  void initState() {
    super.initState();
    EditCategoryCubit.name =
        BlocProvider.of<EditCategoryCubit>(context).renameEditCategory();

    dateTime = EditCategoryCubit.date;
    int indexImage = getIndexImage(
        CategoryCenterCubit.data[EditCategoryCubit.indexEdit!].image!);

    BlocProvider.of<CategoryChooseImageCubit>(context).refresh(indexImage);
  }

  @override
  void dispose() {
    super.dispose();
    EditCategoryCubit.indexEdit = null;
    EditCategoryCubit.name = null;
    CategoryCenterCubit.image = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),
              Expanded(
                flex: 2,
                child: Image.asset(
                  AppImage.edit,
                ),
              ),
              const SizedBox(height: 15),
              CustomerFormFieldWidget(
                hint: LanguageKeys.editCategoryHint.tr(context),
                onSaved: (value) async {
                  EditCategoryCubit.name = value!;
                  EditCategoryCubit.date = dateTime;
                  BlocProvider.of<EditCategoryCubit>(context)
                      .editCategoryData();
                },
                controller: TextEditingController(
                  text: EditCategoryCubit.name,
                ),
              ),
              const Expanded(
                flex: 5,
                child: CustomImageListWidget(),
              ),
              AspectRatio(
                aspectRatio: 8 / 1,
                child: TextButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      AppColor.main,
                    ),
                  ),
                  onPressed: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.parse(dateTime!),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2050),
                    ).then(
                      (value) {
                        if (value != null) {
                          dateTime = dateTimeFrame(value);
                          if (!context.mounted) return;
                          BlocProvider.of<ChangeDateCubit>(context)
                              .changeDate();
                          // setState(() {});
                        }
                      },
                    );
                  },
                  child: BlocBuilder<ChangeDateCubit, ChangeDateState>(
                    builder: (context, state) {
                      return Text(
                        dateTimeCategory(context,dateTime ?? ""),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getResponsiveText(context, fontSize: 14),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 15),
              AspectRatio(
                  aspectRatio: 6 / 1,
                  child: CustomTwoButtonWidget(
                      textButton: LanguageKeys.save.tr(context),
                      onPressed: _onPressed)),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context);
      // Navigator.of(context).pushNamedAndRemoveUntil(
      //     HomeCategoryScreen.id, (route) => false);
    } else {
      _autoValidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
