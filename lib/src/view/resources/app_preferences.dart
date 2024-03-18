import 'dart:async';

import 'package:encrypt/encrypt.dart';
import 'package:MoboPex/src/view/resources/preferences_constants.dart';
import 'package:MoboPex/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {

  final tag = "AppPreferences";

  AppPreferences._() {
    final key = Key.fromLength(32);
    _iv = IV.fromLength(16);
    _encrypter = Encrypter(AES(key));
  }

  static AppPreferences instance = AppPreferences._();
  static SharedPreferences? _sharedPreferences;
  static late Encrypter _encrypter;
  static late IV _iv;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static String? _encrypt(String? input) {
    if (input.isNotNullOrEmpty) {
      final encrypted = _encrypter.encrypt(input!, iv: _iv);
      return encrypted.base64;
    }
    return null;
  }

  static String? _decrypt(String? input) {
    if (input.isNotNullOrEmpty) {
      return _encrypter.decrypt64(input!, iv: _iv);
    }
    return null;
  }

  Future<bool> _saveString(String key, String? value) {
    return _sharedPreferences!.setString(key, _encrypt(value) ?? "");
  }

  String? _getString(String key, {String? defaultValue = ""}) {
    String? encryptedValue;
    try {
      encryptedValue = _sharedPreferences!.getString(key);
    } catch (e) {
      Logger.e(tag, error: e);
    }
    if (encryptedValue == null) {
      return defaultValue;
    }
    return _decrypt(encryptedValue) ?? defaultValue;
  }

  Future<bool> _saveInt(String key, int value) {
    return _saveString(key, value.toString());
  }

  int _getInt(String key, {int defaultValue = 0}) {
    final str = _getString(key, defaultValue: defaultValue.toString());
    final value = int.tryParse(str!);
    if (value != null) {
      return value;
    }
    return defaultValue;
  }

  // Future<bool> _saveDouble(String key, double value) {
  //   return _saveString(key, value.toString());
  // }
  //
  // double _getDouble(String key, {double defaultValue = 0.0}) {
  //   final str = _getString(key, defaultValue: defaultValue.toString());
  //   final value = double.tryParse(str!);
  //   if (value != null) {
  //     return value;
  //   }
  //   return defaultValue;
  // }

  Future<bool> _saveBoolean(String key, bool value) {
    return _saveInt(key, value ? 1 : 0);
  }

  bool _getBoolean(String key, {bool defaultValue = false}) {
    return _getInt(key, defaultValue: defaultValue ? 1 : 0) == 1;
  }

  ///************************************************************************************************************///
  ///********************************////* Write App Specific methods here *////********************************///
  ///************************************************************************************************************///

  bool get isFirstTimeInstalled =>
      _getBoolean(PreferencesConstants.isFirstTimeInstalled,
          defaultValue: false);

  Future<bool> setFirstTimeInstalled(bool value) {
    return _saveBoolean(PreferencesConstants.isFirstTimeInstalled, value);
  }

  bool get isDarkMode =>
      _getInt(PreferencesConstants.themeMode, defaultValue: 0) == 1;

  Future<bool> setThemeMode(int value) {
    return _saveInt(PreferencesConstants.themeMode, value);
  }
}
