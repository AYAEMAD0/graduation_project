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
}
