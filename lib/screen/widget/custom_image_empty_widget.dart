import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/app_image.dart';
import 'package:note_application/screen/companded/custom_sheet_camera_galley_widget.dart';

class CustomImageEmptyWidget extends StatelessWidget {
  const CustomImageEmptyWidget({
    super.key,
    this.child,
  });
  final Image? child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showModalBottomSheet(
          constraints: const BoxConstraints(),
          backgroundColor: SheetColor.background,
          context: context,
          builder: (context) => const CustomSheetCameraGalleryWidget(),
        );
      },
      child: child ??
          Image.asset(
            AppImage.addImage,
            fit: BoxFit.fill,
          ),
    );
  }
}
