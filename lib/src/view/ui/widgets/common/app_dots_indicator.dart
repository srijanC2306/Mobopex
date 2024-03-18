import 'dart:math';

import 'package:flutter/material.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    Key? key,
    required this.controller,
    required this.itemCount,
    this.selectedColor = Colors.black54,
    this.unselectedColor = Colors.black12,
  }) : super(key: key, listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.black54`.
  final Color selectedColor;

  // Defaults to `Colors.black12`
  final Color unselectedColor;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 12.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;

    return SizedBox(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color:
              ((controller.page ?? controller.initialPage).abs()) % itemCount ==
                      index
                  ? selectedColor
                  : unselectedColor,
          type: MaterialType.circle,
          child: SizedBox(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
