import 'package:flutter/material.dart';
import 'package:note_application/constant/app_image.dart';

class CustomEmptyImageWidget extends StatelessWidget {
  const CustomEmptyImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImage.empty,
        width: MediaQuery.sizeOf(context).width * 0.8,
        fit: BoxFit.fill,
      ),
    );
  }
}