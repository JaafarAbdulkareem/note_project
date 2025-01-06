import 'package:flutter/material.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/screen/widget/custom_image_empty_widget.dart';
class CustomDisplayImageWidget extends StatelessWidget {
  const CustomDisplayImageWidget({
    super.key,
    required this.image,
  });
  final String? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () async {
      //   await showModalBottomSheet(
      //     constraints: const BoxConstraints(),
      //     backgroundColor: SheetColor.background,
      //     context: context,
      //     builder: (context) => const CustomSheetCameraGalleryWidget(),
      //   );
      // },
      // onLongPress: () {
      //   //display
      // },
      child: image == null
          ? const CustomImageEmptyWidget()
          : Padding(
              padding: EdgeInsets.all(getResponsiveText(context, fontSize: 6)),
              child: Image.network(
                ConstantImageApiPath.imagePath + image!,
                fit: BoxFit.fill,
              ),
            ),
    );
  }
}
