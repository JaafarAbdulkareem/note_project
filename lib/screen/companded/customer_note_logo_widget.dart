import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/app_image.dart';

class CustomerNoteLogoWidget extends StatelessWidget {
  const CustomerNoteLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.sizeOf(context).width / 5,
      backgroundColor: AppColor.backgroundLogo,
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          AppImage.note,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
