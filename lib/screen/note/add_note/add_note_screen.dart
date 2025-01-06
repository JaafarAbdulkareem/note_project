import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/size_constant.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/note/add_note/add_note_cubit.dart';
import 'package:note_application/cubit/note/note_choose_image/note_choose_image_cubit.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/function/validation_function.dart';
import 'package:note_application/screen/companded/custom_app_bar_widget.dart';
import 'package:note_application/screen/companded/custom_change_image_widget.dart';
import 'package:note_application/screen/companded/custom_two_buttom_widget.dart';
import 'package:note_application/shared/customer_text_field_widget.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({
    super.key,
  });
  static const String id = "Add Note Screen";
  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
    NoteChooseImageCubit.imagePath = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: LanguageKeys.addNote.tr(context),
        height: getResponsiveText(
          context,
          fontSize: ConstantSize.appBarNote,
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getResponsiveText(context, fontSize: 16),
            horizontal: getResponsiveText(context, fontSize: 8),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: CustomChangeImageWidget(image: null),
                      //  CustomAddImageWidget(),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 2,
                      child: CustomerFormFieldWidget(
                        hint: LanguageKeys.addTitleHint.tr(context),
                        onSaved: (value) {
                          title = value!;
                        },
                        controller: _titleController,
                        validator: (value) => validatorGeneral(
                          context,
                          value: value!,
                          min: ConstantSizeValid.validTitlelMin,
                          max: ConstantSizeValid.validTitlelMax,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getResponsiveText(context, fontSize: 15),
                ),
                CustomerFormFieldWidget(
                  minLine: ConstantTextField.minLineContent,
                  maxLine: ConstantTextField.maxLineContent,
                  hint: LanguageKeys.addContentHint.tr(context),
                  onSaved: (value) {
                    content = value!;
                  },
                  controller: _contentController,
                ),
                SizedBox(
                  height: getResponsiveText(context, fontSize: 15),
                ),
                AspectRatio(
                  aspectRatio: 6 / 1,
                  child: CustomTwoButtonWidget(
                      textButton: LanguageKeys.add.tr(context),
                      onPressed: _onPressed),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<AddNoteCubit>(context)
          .addNoteData(context, title!, content!);
      Navigator.pop(context);
    } else {
      _autoValidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
