import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/note/note_choose_image/note_choose_image_cubit.dart';
import 'package:note_application/cubit/note/note_choose_image/note_choose_image_state.dart';
import 'package:note_application/function/flashbar_function.dart';
import 'package:note_application/screen/companded/custom_note_image_widget.dart';

class CustomChangeImageWidget extends StatelessWidget {
  const CustomChangeImageWidget({super.key, required this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteChooseImageCubit, NoteChooseImageState>(
        listener: (context, state) {
      if (state is ErrorNoteChooseImageState) {
        flashBar(
                title: LanguageKeys.alertTitle.tr(context),
                message: state.errorMessage.tr(context))
            .show(context);
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: CustomNoteImageWidget(image: image),
      );
    });
  }
}
