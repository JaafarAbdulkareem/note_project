import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/note/delete_note/delete_note_cubit.dart';
import 'package:note_application/cubit/note/delete_note/delete_note_state.dart';
import 'package:note_application/cubit/note/edit_note/edit_note_state.dart';
import 'package:note_application/function/flashbar_function.dart';
import 'package:note_application/screen/companded/customer_circular_progress_widget.dart';
import 'package:note_application/screen/note/edit_note/edit_note_cubit.dart';
import 'package:note_application/screen/widget/custom_item_note_widget.dart';

class CustomListBuildWidget extends StatelessWidget {
  const CustomListBuildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteNoteCubit, DeleteNoteState>(
      listener: (context, state) {
        if (state is ErrorDeleteNoteState) {
          flashBar(
            title: LanguageKeys.errorTitle.tr(context),
            message: state.errorMessage.tr(context),
          ).show(context);
        }
      },
      builder: (context, state) {
        if (state is LoadingDeleteNoteState) {
          return const CustomerCircularProgressWidget();
        }
        return BlocConsumer<EditNoteCubit, EditNoteState>(
          listener: (context, state) {
            if (state is ErrorEditNoteState) {
              flashBar(
                title: LanguageKeys.errorTitle.tr(context),
                message: state.errorMessage.tr(context),
              ).show(context);
            }
          },
          builder: (context, state) {
            if (state is LoadingEditNoteState) {
              return const CustomerCircularProgressWidget();
            }
            return ListView.builder(
              itemCount: NoteCenter.data.length,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 5 / 1,
                  child: CustomItemNoteWidget(
                    data: NoteCenter.data[index],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
