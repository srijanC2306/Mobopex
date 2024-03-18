import 'package:MoboPex/src/view/ui/base_content_mixin.dart';
import 'base_stateful_widget.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';

abstract class BaseStatelessWidget extends StatelessWidget
    with BaseContentWidget {
  const BaseStatelessWidget({Key? key}) : super(key: key);

  double get screenHeight => Get.height;

  double get screenWidth => Get.width;


}

class BaseTextStyle extends TextStyle {
  const BaseTextStyle({
    required Color color,
    required double fontSize,
    FontWeight? fontWeight,
    double wordSpacing = 0.3,
    double letterSpacing = -0.32,
    double height = 1.6,
  }) : super(
    fontFamily: "Inter",
    fontSize: fontSize,
    color: color,
    letterSpacing: letterSpacing,
    fontWeight: fontWeight,
    wordSpacing: 0.3,
    height: height,
  );
}
