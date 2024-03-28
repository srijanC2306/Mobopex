import 'package:flutter/material.dart';


class BackNavigationButton extends StatelessWidget {
  final NavigatorState navigator;
  final double? size;
  final double padding;
  final VoidCallback? onPop;
  final Color color;
  const BackNavigationButton({
    super.key,
    required this.navigator,
    this.size,
    this.padding = 0,
    this.onPop,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    if (!navigator.canPop()) {
      return Container();
    }
    return IconButton(
       icon: Icon(Icons.arrow_back ,
      size: size),
      color: color,
      onPressed: () {
        navigator.pop();
        if (onPop != null) onPop!();
      },
    );
  }
}
