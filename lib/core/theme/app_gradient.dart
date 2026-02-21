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

  static const LinearGradient gradientUploadCvJd = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6F93C9),
      Color(0xFFE9EEF3),
      Color(0xFFF3F4F6),
      Color(0xFFD7C8EC),
      Color(0xFFA178D8),
    ],
    stops: [
      0.0,
      0.25,
      0.45,
      0.75,
      1.0,
    ],
  );
}
