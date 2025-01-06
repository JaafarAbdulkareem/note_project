import 'package:flutter/material.dart';
import 'package:note_application/constant/size_constant.dart';

double getResponsiveText(BuildContext context, {required double fontSize}) {
  double width = MediaQuery.sizeOf(context).width;
  final double responsivePoint;
  double newFontSize, lowLimit, upLimit;
  if (width <= ConstantSizeLayout.mobileLayout ||
      width <= ConstantSizeLayout.tabletLayout) {
    responsivePoint = 360;
    lowLimit = fontSize * 0.95;
    upLimit = fontSize * 3.25;
  } else {
    responsivePoint = ConstantSizeLayout.desktopResponsivePoint;
    lowLimit = fontSize * 0.8;
    upLimit = fontSize * 1.2;
  }
  newFontSize = width * fontSize / responsivePoint;
  return newFontSize.clamp(lowLimit, upLimit);
  // double width = MediaQuery.sizeOf(context).width;
  // final double responsivePoint;
  // double newFontSize, lowLimit, upLimit;
  // if (width <= ConstantSizeLayout.mobileLayout) {
  //   responsivePoint = ConstantSizeLayout.mobileResponsivePoint;
  // } else if (width <= ConstantSizeLayout.tabletLayout) {
  //   responsivePoint = ConstantSizeLayout.tabletResponsivePoint;
  // } else {
  //   responsivePoint = ConstantSizeLayout.desktopResponsivePoint;
  // }

  // newFontSize = width * fontSize / responsivePoint;
  // lowLimit = fontSize * 0.8;
  // upLimit = fontSize * 1.2;
  // return newFontSize.clamp(lowLimit, upLimit);
}
