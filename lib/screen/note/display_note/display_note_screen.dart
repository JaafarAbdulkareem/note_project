import 'package:flutter/material.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/models/note/note_model.dart';

class DisplayNoteScreen extends StatefulWidget {
  const DisplayNoteScreen({
    super.key,
  });
  static const String id = "Display Note Screen";

  @override
  State<DisplayNoteScreen> createState() => _DisplayNoteScreenState();
}

class _DisplayNoteScreenState extends State<DisplayNoteScreen> {
  late NoteModel data = ModalRoute.of(context)!.settings.arguments as NoteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(getResponsiveText(context, fontSize: 12)),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:getResponsiveText(context, fontSize: 16)),
                Text(
                  data.title ?? "",
                  style: TextStyle(
                    fontSize: getResponsiveText(context, fontSize: 32),
                    color: AppColor.main,
                  ),
                ),
                data.image != null ? Image.network(ConstantImageApiPath.imagePath + data.image!,fit: BoxFit.fill,) : const SizedBox(height: 8),
               const SizedBox(height: 8), 
                Text(
                  data.content ?? "",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: getResponsiveText(context, fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
