import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greengrocer_mobile/app/auth/sign_in_screen.dart';
import 'package:greengrocer_mobile/app/core/ui/ui_config.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        title: UiConfig.title,
        theme: UiConfig.theme,
        debugShowCheckedModeBanner:  false,
        home: const SignInScreen()
      ),
    );
  }
}