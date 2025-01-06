import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/icon_constant.dart';
import 'package:note_application/cubit/password/password_cubit.dart';
import 'package:note_application/cubit/password/password_state.dart';
import 'package:note_application/function/pincode/edit_delete.dart';
import 'package:note_application/function/pincode/unlock.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/screen/companded/customer_circular_progress_widget.dart';
import 'package:note_application/screen/note/display_note/display_note_screen.dart';

class CustomLockNoteWidget extends StatelessWidget {
  const CustomLockNoteWidget({
    super.key,
    required this.index,
  });
  final int? index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubit, PasswordState>(
      builder: (context, state) {
        if (state is LoadingPasswordState) {
          return const CustomerCircularProgressWidget(
            color: NoteColor.backgroundItem,
          );
        }
        return InkWell(
          onTap: () {
            unlock(
                context: context,
                index: index!,
                okOnPressed: () {
                  Navigator.of(context).pushNamed(
                    DisplayNoteScreen.id,
                    arguments: NoteCenter.data[index!],
                  );
                }).show();
          },
          onLongPress: () {
            editAndDeletePinCode(context: context, index: index!).show();
          },
          child: ColoredBox(
            color: NoteColor.backgroundItem,
            child: Icon(
              ConstantIcon.lock,
              size: getResponsiveText(context, fontSize: 45),
            ),
          ),
        );
      },
    );
  }
}
