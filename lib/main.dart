import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greengrocer_mobile/app/core/ui/ui_config.dart';
import 'package:greengrocer_mobile/app/pages_routes/app_pages.dart';

import 'app/pages/auth/controller/auth_controller.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => GetMaterialApp(
        title: UiConfig.title,
        theme: UiConfig.theme,
        initialRoute: PagesRoutes.signinRoute,
        getPages: AppPages.pages,
        debugShowCheckedModeBanner:  false,
        
      ),
    );
  }
}