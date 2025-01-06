import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/app_image.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/screen/note/add_note/add_note_screen.dart';

class CustomAddNoteButtonWidget extends StatelessWidget {
  const CustomAddNoteButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        Navigator.of(context).pushNamed(AddNoteScreen.id);
      },
      icon: Image.asset(
        AppImage.addNote,
        width: getResponsiveText(context, fontSize: 70),
        color: AppColor.main,
      ),
    );
  }
}
