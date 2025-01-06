import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/function/respponsive_text_function.dart';

class CustomerDefinitionScreenWidget extends StatelessWidget {
  const CustomerDefinitionScreenWidget({
    super.key,
    required this.title,
    required this.content,
    this.titleSize = 28,
    this.titlecontent = 14,
  });
  final String title;
  final String content;
  final double titleSize;
  final double titlecontent;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        title,
        style: TextStyle(
            fontSize: getResponsiveText(context, fontSize: titleSize), //28
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis),
      ),
      subtitle: Text(
        content,
        style: TextStyle(
            fontSize: getResponsiveText(context, fontSize: titlecontent), //12
            color: TextColor.logInContent,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
