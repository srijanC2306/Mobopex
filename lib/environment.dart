import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

abstract class Environment {
  static const String production = "prod";
  static const String development = "dev";
  static const String userAcceptance = "uat";

  static var _config = <String, dynamic>{};

  static Future<void> initialize(String env) async {
    String configAssetsPath;
    debugPrint("******************");
    debugPrint("ENVIRONMENT: "+env);
    debugPrint("******************");
    switch (env) {
      case production:
        configAssetsPath = "assets/env/prod.json";
        break;
      case development:
        configAssetsPath = "assets/env/dev.json";
        break;
      case userAcceptance:
        configAssetsPath = "assets/env/uat.json";
        break;
      default:
        configAssetsPath = "assets/env/prod.json";
    }
    final configString = await rootBundle.loadString(configAssetsPath);
    _config = jsonDecode(configString);
  }

  static String get staticBaseUrl {
    return _config['staticBaseUrl'] as String;
  }

  static bool get logEnabled {
    return _config['logEnabled'] as bool;
  }

  static String get dbPassword {
    return _config['dbPassword'] as String;
  }
}
