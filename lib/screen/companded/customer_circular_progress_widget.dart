import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';

class CustomerCircularProgressWidget extends StatelessWidget {
  const CustomerCircularProgressWidget({super.key, this.color});
final Color? color;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: color,
      body:  const Center(
        child: CircularProgressIndicator(
          color: AppColor.main,
        ),
      ),
    );
  }
}
