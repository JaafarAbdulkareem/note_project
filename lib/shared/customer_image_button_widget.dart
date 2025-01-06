import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/function/respponsive_text_function.dart';

class CustomerImageButtomWidget extends StatelessWidget {
  const CustomerImageButtomWidget({
    super.key,
    required this.title,
    required this.color,
    this.image,
    required this.onPressed,
  });

  final String title;
  final Color color;
  final String? image;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: getResponsiveText(context, fontSize: 18)),
      // aspectRatio = 8/1
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(
                vertical: getResponsiveText(context, fontSize: 10)),
          ),
          backgroundColor: WidgetStatePropertyAll<Color>(color),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: TextColor.buttonText,
                fontSize: getResponsiveText(context, fontSize: 16), //14
              ),
            ),
            const SizedBox(width: 6),
            image != null
                ? Image.asset(
                    image!,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
