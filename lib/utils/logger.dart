import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:MoboPex/environment.dart';

class Logger {
  Logger._();

  static const _tag = "FlutterBase.app";

  static i(dynamic info, {String tag = _tag, bool isJson = false}) {
    if (Environment.logEnabled) {
      if(kDebugMode) {
        developer.log(isJson ? jsonEncode(info) : info, name: tag);
      }else{
        debugPrint("TAG: $tag" +  (isJson ? jsonEncode(info) : info));
      }
    }
  }

  //Check in release mode
  static e(String message, {String tag = _tag, Object? error, StackTrace? stackTrace}) {
    if (Environment.logEnabled) {
      if(kDebugMode) {
        developer.log(message, name: tag, error: error, stackTrace: stackTrace);
      }else{
        debugPrint("TAG: $tag $message\n Error: $error\n StackTrace: $stackTrace");
      }
    }
  }
}
