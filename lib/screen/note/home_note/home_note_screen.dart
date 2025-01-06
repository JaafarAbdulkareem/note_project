import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/size_constant.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/note/add_note/add_note_cubit.dart';
import 'package:note_application/cubit/note/add_note/add_note_state.dart';
import 'package:note_application/function/flashbar_function.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/screen/companded/custom_app_bar_widget.dart';
import 'package:note_application/screen/companded/customer_circular_progress_widget.dart';
import 'package:note_application/screen/widget/custom_add_note_button_widget.dart';
import 'package:note_application/screen/widget/custom_note_build_widget.dart';

class HomeNoteScreen extends StatelessWidget {
  const HomeNoteScreen({super.key});
  static const String id = "Home Note Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWidget(
          title: NoteCenter.categoryName.toString(),
          height: getResponsiveText(
            context,
            fontSize: ConstantSize.appBarNote,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const CustomAddNoteButtonWidget(),
        body: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is ErrorAddNoteState) {
              flashBar(
                title: LanguageKeys.errorTitle.tr(context),
                message: state.errorMessage.tr(context),
              ).show(context);
            }
          },
          builder: (context, state) {
            if (state is SuccessedAddNoteState) {
              return const CustomNoteBuildWidget();
            } else if (state is LoadingAddNoteState) {
              return const CustomerCircularProgressWidget();
            }
            return const CustomNoteBuildWidget();
          },
        ));
  }
}
