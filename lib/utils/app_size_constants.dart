import 'package:flutter/material.dart';


class AppSizeConstants {
  static const double buttonH = 60;
}



Offset getPercentageOffset(BuildContext context, double widthPercent, double heightPercent) {
  final screenWidth = MediaQuery.of(context).size.width.clamp(50.0, 60.0);
  final screenHeight = MediaQuery.of(context).size.height.clamp(50.0, 60.0);
  return Offset(screenWidth * widthPercent, screenHeight * heightPercent);
}