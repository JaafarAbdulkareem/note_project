import 'package:flutter/material.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/constant/app_image.dart';
import 'package:note_application/screen/widget/custom_image_empty_widget.dart';

class CustomDisplayImageWidget extends StatelessWidget {
  const CustomDisplayImageWidget({
    super.key,
    required this.image,
  });
  final String? image;
  @override
  Widget build(BuildContext context) {
    return image == null || image!.isEmpty
        ? Image.asset(
            AppImage.addImage,
            fit: BoxFit.fill,
          )
        :
        //  CustomImageEmptyWidget(
        //     child: 
            Image.network(
              ConstantImageApiPath.imagePath + image!,
              fit: BoxFit.fill,
            // ),
          );
  }
}
