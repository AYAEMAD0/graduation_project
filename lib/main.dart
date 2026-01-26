import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(439, 951),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return  MaterialApp(
            debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
