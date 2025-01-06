import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_application/constant/app_lottie.dart';

class CustomLoadingInitialWidget extends StatelessWidget {
  const CustomLoadingInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Lottie.asset(
                AppLottie.loading,
                fit: BoxFit.fill,
              ),
            ),
            AspectRatio(
              aspectRatio: 2 / 1,
              child: Lottie.asset(
                AppLottie.pleaseWait,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
