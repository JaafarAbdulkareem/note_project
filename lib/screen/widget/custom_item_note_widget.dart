import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/password/password_cubit.dart';
import 'package:note_application/cubit/password/password_state.dart';
import 'package:note_application/function/flashbar_function.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/models/note/note_model.dart';
import 'package:note_application/screen/widget/custom_lock_note_widget.dart';
import 'package:note_application/screen/widget/custom_list_title_widget.dart';

class CustomItemNoteWidget extends StatefulWidget {
  const CustomItemNoteWidget({
    super.key,
    required this.data,
  });
  final NoteModel data;

  @override
  State<CustomItemNoteWidget> createState() => _CustomItemNoteWidgetState();
}

class _CustomItemNoteWidgetState extends State<CustomItemNoteWidget> {
  int? _index;
  @override
  void initState() {
    super.initState();
    _index = NoteCenter.data.indexOf(widget.data);
  }

  @override
  void dispose() {
    super.dispose();
    _index = null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordCubit, PasswordState>(
      listener: (context, state) {
        if (state is ErrorPasswordState) {
          flashBar(
            title: LanguageKeys.errorTitle.tr(context),
            message: state.errorMessage.tr(context),
          ).show(context);
        } else if (state is MessageNewPasswordState) {
          flashBar(
            title: LanguageKeys.alertTitle.tr(context),
            message: LanguageKeys.newPassword.tr(context),
          ).show(context);
        } else if (state is SuccessedRepasswordState) {
          flashBar(
            title: LanguageKeys.alertTitle.tr(context),
            message: LanguageKeys.changePassword.tr(context),
          ).show(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: getResponsiveText(context, fontSize: 2),
            horizontal: getResponsiveText(context, fontSize: 8),
          ),
          child: widget.data.password == null || widget.data.password!.isEmpty
              ? CustomListTitleWidget(data: widget.data, index: _index)
              : CustomLockNoteWidget(
                  index: _index,
                ),
        );
      },
    );
  }
}
