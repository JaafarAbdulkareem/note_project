import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/size_constant.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/function/validation_function.dart';
import 'package:note_application/screen/companded/custom_app_bar_widget.dart';
import 'package:note_application/screen/companded/custom_change_image_widget.dart';
import 'package:note_application/screen/companded/custom_two_buttom_widget.dart';
import 'package:note_application/screen/note/edit_note/edit_note_cubit.dart';
import 'package:note_application/shared/customer_text_field_widget.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});
  static const String id = "Edit Note Screen";

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  // String? _title, content;
  String? _image;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: NoteCenter
          .data[BlocProvider.of<EditNoteCubit>(context).indexEdit!].title,
    );
    _contentController = TextEditingController(
      text: NoteCenter
          .data[BlocProvider.of<EditNoteCubit>(context).indexEdit!].content,
    );

    _image = NoteCenter
        .data[BlocProvider.of<EditNoteCubit>(context).indexEdit!].image;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
    _image = null;
    // NoteChooseImageCubit.imagePath = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: LanguageKeys.editNote.tr(context),
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
                    Expanded(
                      child: CustomChangeImageWidget(image: _image),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 2,
                      child: CustomerFormFieldWidget(
                        hint: LanguageKeys.addTitleHint.tr(context),
                        controller: _titleController,
                        onSaved: (value) {
                          BlocProvider.of<EditNoteCubit>(context).title =
                              value!;
                          BlocProvider.of<EditNoteCubit>(context).content =
                              _contentController.text;

                          BlocProvider.of<EditNoteCubit>(context).image =
                              _image;
                        },
                        validator: (value) => validatorGeneral(context,
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
                  controller: _contentController,
                ),
                SizedBox(
                  height: getResponsiveText(context, fontSize: 15),
                ),
                AspectRatio(
                  aspectRatio: 6 / 1,
                  child: CustomTwoButtonWidget(
                      textButton: LanguageKeys.save.tr(context),
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
      BlocProvider.of<EditNoteCubit>(context).editNoteData();
      Navigator.pop(context);
    } else {
      _autoValidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
