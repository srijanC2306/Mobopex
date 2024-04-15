import 'package:MoboPex/routes/route_constants.dart';
import 'package:MoboPex/routes/routes.dart';
import 'package:MoboPex/src/core/theme/custom_theme_extension.dart';
import 'package:MoboPex/src/model/data/mapper.dart';
import 'package:MoboPex/src/view/resources/localization/app_translations.dart';
import 'package:MoboPex/src/view/resources/resources.dart';
import 'package:MoboPex/src/view_model/initial_bindings.dart';
import 'package:MoboPex/utils/layout_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'environment.dart';


GlobalKey<NavigatorState> dashboardNavKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> globalNavKey = GlobalKey<NavigatorState>();

Future<void> app(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  MapperFactory.initialize();
  await Environment.initialize(env);
  await InitialBindings().dependencies();
  runApp(const MaterialApp());
}

Widget get _getMaterialApp => GetMaterialApp(
      title: 'Flutter', //set from translations
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      navigatorKey: globalNavKey,
      fallbackLocale:
          const Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      getPages: Routes.get(),
      //theme: Themes.light,
      theme: ThemeData(
        fontFamily: 'Roboto', //Use Constants
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorConstants.primaryColor,
        ),
      ),
      //darkTheme: Themes.dark,
      //themeMode: ThemeMode.system,
      //AppPreferences.instance.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      //defaultTransition: Transition.rightToLeft,
      initialRoute: RouteConstants.splash,
  // home: Test_Screen(),
    );


class MaterialApp extends StatelessWidget {
  const MaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        CustomThemeExtension.setScaleFactor(LayoutUtils.calculateScaleFactor(context));
        return GetMaterialApp(
          title: 'Flutter', //set from translations
          debugShowCheckedModeBanner: false,
          translations: AppTranslations(),
          locale: Get.deviceLocale,
          fallbackLocale:
          const Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
          getPages: Routes.get(),
          //theme: Themes.light,
          theme: ThemeData(
            fontFamily: 'Roboto', //Use Constants
            appBarTheme: const AppBarTheme(
              backgroundColor: ColorConstants.primaryColor,
            ),
          ),
          //darkTheme: Themes.dark,
          //themeMode: ThemeMode.system,
          //AppPreferences.instance.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          //defaultTransition: Transition.rightToLeft,
          initialRoute: RouteConstants.dashboard,
          // home: Test_Screen(),
        );
      }
    );;
  }
}

