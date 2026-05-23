import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.whiteColor,
  );
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.darkBackgroundColor,
    colorScheme: const ColorScheme.dark(
      primary: AppColor.primaryPurpleColor,
      surface: AppColor.darkContainerColor,
    ),
  );

}
