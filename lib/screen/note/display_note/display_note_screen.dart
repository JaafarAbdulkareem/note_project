import 'package:flutter/material.dart';
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
      body: Center(child: Text(data.title.toString())),
    );
  }
}
