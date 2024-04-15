import 'package:MoboPex/routes/route_constants.dart';
import 'package:MoboPex/src/view/ui/screens/dashboard/dashboard.dart';
import 'package:MoboPex/src/view/ui/screens/navigation/home/product_page.dart';
import 'package:MoboPex/src/view/ui/screens/onboarding/register_screen.dart';
import 'package:MoboPex/src/view/ui/screens/onboarding/welcome_screen.dart';
import 'package:MoboPex/src/view/ui/screens/splash/splash_screen.dart';
import 'package:MoboPex/src/view/ui/screens/test_screen1.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:MoboPex/src/view_model/onboarding/test_bindings.dart';

import '../src/view/ui/screens/onboarding/login_screen.dart';

class OnBoardingRoutes {
  OnBoardingRoutes._();

  static List<GetPage> get routes => [
        GetPage(
          name: RouteConstants.welcomeGuideRoute,
          page: () => WelcomeScreen(),
        ),
        GetPage(
          name: RouteConstants.splash,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: RouteConstants.registerRoute,
          page: () => Scaffold(
            resizeToAvoidBottomInset: true,
                body: RegisterScreen()),
        ),
        GetPage(
            name: RouteConstants.loginRoute,
            page: () =>
                 Scaffold(resizeToAvoidBottomInset: true, body: LoginScreen()),
            binding: TestBindings()),
        GetPage(
          name: RouteConstants.dashboard,
          page: () => const  Dashboard(),
        ),

    // GetPage(
    //   name: RouteConstants.productDetailRoute,
    //   page: () => const ProductPage(),
    // ),
      ];
}
