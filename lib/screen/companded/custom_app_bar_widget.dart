import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/function/respponsive_text_function.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    required this.title,
    required this.height,
  });
  final String title;
  final double height;
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(title),
      titleTextStyle: TextStyle(
        color: AppColor.main,
        fontSize: getResponsiveText(context, fontSize: 20),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
