
// layout_utils.dart
import 'package:flutter/widgets.dart';

class LayoutUtils {
  static double _calculateScaleFactor(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    const double baseWidth = 375.0;
    return screenWidth / baseWidth;
  }


  static double calculateScaleFactor(BuildContext context) {
    return _calculateScaleFactor(context);
  }
}

