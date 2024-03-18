import 'package:get/get.dart';
import 'languages/languages.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US": English.translations,
    "hi_IN": Hindi.translations,
  };
}
