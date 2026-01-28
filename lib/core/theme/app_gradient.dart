import 'package:flutter/material.dart';

import 'app_color.dart';

class AppGradient {
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColor.primaryBlueColor,
      AppColor.primaryPurpleColor,
    ],
  );
  static const LinearGradient gradientSplash = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF6997DD),
      Color(0xFFE5E5E5),
      Color(0xFFB87CF8),
    ],
  );
}
