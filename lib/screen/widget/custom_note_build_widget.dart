import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/cubit/note/delete_note/delete_note_cubit.dart';
import 'package:note_application/cubit/note/delete_note/delete_note_state.dart';
import 'package:note_application/screen/widget/custom_empty_image_widget.dart';
import 'package:note_application/screen/widget/custom_list_build_widget.dart';

class CustomNoteBuildWidget extends StatelessWidget {
  const CustomNoteBuildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteNoteCubit, DeleteNoteState>(
      builder: (context, state) {
        return NoteCenter.data.isEmpty
            ? const CustomEmptyImageWidget()
            : const CustomListBuildWidget();
      },
    );
  }
}
