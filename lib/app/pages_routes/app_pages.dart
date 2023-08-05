import 'package:get/get.dart';
import 'package:greengrocer_mobile/app/pages/auth/view/sign_in_screen.dart';
import 'package:greengrocer_mobile/app/pages/base/base_screen.dart';

import '../pages/auth/view/sign_up_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.signinRoute,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: PagesRoutes.signUpRoute,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => const BaseScreen(),
    ),
  ];
}

abstract class PagesRoutes {
  static String signinRoute = '/siginin';
  static String signUpRoute = '/siginup';
  static String baseRoute = '/';
}
