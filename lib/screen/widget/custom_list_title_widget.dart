import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/icon_constant.dart';
import 'package:note_application/cubit/note/delete_note/delete_note_cubit.dart';
import 'package:note_application/function/awesome_dialog/yes_no_function.dart';
import 'package:note_application/function/pincode/lock.dart';
import 'package:note_application/models/note/note_model.dart';
import 'package:note_application/screen/companded/cusomer_definition_screen_widget.dart';
import 'package:note_application/screen/companded/custom_icon_button_widget.dart';
import 'package:note_application/screen/note/display_note/display_note_screen.dart';
import 'package:note_application/screen/note/edit_note/edit_note_cubit.dart';
import 'package:note_application/screen/note/edit_note/edit_note_screen.dart';
import 'package:note_application/screen/widget/custom_display_image_widget.dart';

class CustomListTitleWidget extends StatelessWidget {
  const CustomListTitleWidget({
    super.key,
    required this.data,
    required this.index,
  });

  final NoteModel data;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(DisplayNoteScreen.id, arguments: data,);
      },
      child: ColoredBox(
        color: NoteColor.backgroundItem,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: CustomDisplayImageWidget(image: data.image)),
            const SizedBox(width: 15),
            Expanded(
                flex: 2,
                child: CustomerDefinitionScreenWidget(
                  title: data.title!,
                  content: data.content!,
                  titleSize: 18,
                  titlecontent: 14,
                )),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomIconButtonWidget(
                    onPressed: () {
                      lock(context: context, index: index).show();
                    },
                    icon: ConstantIcon.lock,
                  ),
                  CustomIconButtonWidget(
                    onPressed: () {
                      yesAndNo(
                        context: context,
                        yesOnPress: () {
                          BlocProvider.of<DeleteNoteCubit>(context).deleteNote(
                            context,
                            index ?? -1,
                          );
                        },
                      ).show();
                    },
                    icon: ConstantIcon.delete,
                  ),
                  CustomIconButtonWidget(
                    onPressed: () {
                      BlocProvider.of<EditNoteCubit>(context).indexEdit = index;
                      Navigator.of(context).pushNamed(EditNoteScreen.id);
                    },
                    icon: ConstantIcon.edit,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
