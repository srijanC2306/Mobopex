import 'package:MoboPex/src/view/base_stateful_widget.dart';
import 'package:MoboPex/src/view/resources/app_preferences.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
  );

  static changeTheme({ThemeData? mode}) {
    bool isDarkMode = mode != null ? mode == Themes.dark : Get.isDarkMode;
    AppPreferences.instance.setThemeMode(isDarkMode ? 0 : 1);
    isDarkMode ? Get.changeTheme(Themes.light) : Get.changeTheme(Themes.dark);
  }
}
