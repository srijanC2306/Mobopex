import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:flutter/material.dart';

class PrimaryTextBtn extends StatelessWidget {
  final String text;
  final VoidCallback? onClicked;
  final Widget? icon;
  final TextStyle? textStyle;

  const PrimaryTextBtn({
    Key? key,
    required this.text,
    required this.onClicked,
    this.icon,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return TextButton.icon(
        onPressed: onClicked,
        icon: icon!,
        label: Text(
          text,
          style: _textStyle,
        ),
      );
    }
    return TextButton(
      onPressed: onClicked,
      child: Text(
        text,
        style: _textStyle,
      ),
    );
  }

  TextStyle get _textStyle =>
      textStyle ??
      const TextStyle(
        fontSize: 14,
        color: ColorConstants.greyColor,
      );
}
