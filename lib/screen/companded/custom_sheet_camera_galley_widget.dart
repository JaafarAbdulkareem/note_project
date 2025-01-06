import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_application/constant/icon_constant.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/note/note_choose_image/note_choose_image_cubit.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/screen/companded/custom_elevated_button_widget.dart';

class CustomSheetCameraGalleryWidget extends StatelessWidget {
  const CustomSheetCameraGalleryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getResponsiveText(
          context,
          fontSize: 24,
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 4.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomElevatedButtonWidget(
                icon: ConstantIcon.camera,
                text: LanguageKeys.camera.tr(context),
                onPressed: () async {
                  await BlocProvider.of<NoteChooseImageCubit>(context)
                      .chooseImage(
                    source: ImageSource.camera,
                    context: context,
                  );
                  if (!context.mounted) return;
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(width: getResponsiveText(context, fontSize: 16)),
            Expanded(
              child: CustomElevatedButtonWidget(
                icon: ConstantIcon.gallery,
                text: LanguageKeys.gallery.tr(context),
                onPressed: () async {
                  await BlocProvider.of<NoteChooseImageCubit>(context)
                      .chooseImage(
                    source: ImageSource.gallery,
                    context: context,
                  );
                  if (!context.mounted) return;
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
