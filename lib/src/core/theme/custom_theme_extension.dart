import 'package:MoboPex/src/core/theme/sizing.dart';
import 'package:MoboPex/src/core/theme/spacing.dart';
import 'package:flutter/material.dart';

extension CustomThemeExtension on ThemeData {
  static late final Spacing _spacing = Spacing();
  static final Sizing _sizing = Sizing();

  Spacing get spacing => _spacing;

  Sizing get sizing => _sizing;

  static void setScaleFactor(double scaleFactor) {
    _spacing.scale(scaleFactor);
    _sizing.scale(scaleFactor);
  }
}
