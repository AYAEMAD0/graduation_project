import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@injectable
class ThemeCubit extends Cubit<ThemeMode> {
  static const String _themeKey = "is_dark_mode";
  ThemeCubit() : super(ThemeMode.light) {
    _themeKey;
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_themeKey) ?? false;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (state == ThemeMode.dark) {
      await prefs.setBool(_themeKey, false);
      emit(ThemeMode.light);
    } else {
      await prefs.setBool(_themeKey, true);
      emit(ThemeMode.dark);
    }
  }
}
