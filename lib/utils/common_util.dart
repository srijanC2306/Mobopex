import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonUtil {

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch as Map<int, Color>);
  }

  static bool isValidEmail(String? value) {
    return value != null ? GetUtils.isEmail(value) : false;
  }

  static bool isValidPhoneNo(String? value) {
    return value != null ? GetUtils.isPhoneNumber(value) : false;
  }

  static bool isValidPassword(String? value) {
    if (value == null) return false;

    String pattern =
        r"^(?=.*\d)(?=.*[A-Z])(?!.*[^a-zA-Z0-9`!~@#$%^&*])(.{6,15})";
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  static bool isValidUrl(String? url) {
    if (url == null) return false;
    return GetUtils.isURL(url);
  }

  static String getInitialChar(String? str) {
    if (str == null) return "";
    return str.substring(0, 1).toUpperCase();
  }

  static double? checkDouble(dynamic value) {
    try {
      if (value is String) {
        return double.parse(value);
      } else if (value is int) {
        return 0.0 + value;
      } else {
        return value;
      }
    } catch (e) {
      return null;
    }
  }

  static bool isInt(String? s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }
}
