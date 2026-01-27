import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_mate_ai/core/routes/AppRoutes.dart';
import 'package:mock_mate_ai/features/auth/presentation/screen/Login_Screen.dart';

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
          routes: {
              AppRoutes.login: (context) => const LoginScreen(),
          },
          initialRoute: AppRoutes.login,

        );
      },
    );
  }
}
