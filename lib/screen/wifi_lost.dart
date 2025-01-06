import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_application/constant/app_lottie.dart';

class WifiLost extends StatelessWidget {
  const WifiLost({super.key});
static const String id = "WIFI Lost";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppLottie.wifiLost,
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}
