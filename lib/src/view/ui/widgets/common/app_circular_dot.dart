import 'package:flutter/material.dart';

/// An indicator showing the currently selected page of a PageController
class AppCircularDot extends StatelessWidget {
  // The size of the dot
  final double size;

  /// Defaults to `Colors.red`.
  final Color color;

  const AppCircularDot({
    this.size = 6.0,
    this.color = Colors.red,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
