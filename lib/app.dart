import 'package:flutter/material.dart';
import 'package:MoboPex/src/view/resources/resources.dart';
import 'package:get/get.dart';
import 'package:MoboPex/routes/route_constants.dart';
import 'package:MoboPex/routes/routes.dart';
import 'package:MoboPex/src/model/data/mapper.dart';
import 'package:MoboPex/src/view/resources/localization/app_translations.dart';
import 'package:MoboPex/src/view_model/initial_bindings.dart';
import 'package:sizer/sizer.dart';

import 'environment.dart';

Future<void> app(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  MapperFactory.initialize();
  await Environment.initialize(env);
  await InitialBindings().dependencies();
  runApp(_getMaterialApp);
}

Widget get _getMaterialApp => Sizer(
  builder: (context , orientation , deviceType)=> GetMaterialApp(
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
        initialRoute: RouteConstants.splash,
    // home: Test_Screen(),
      ),
);
