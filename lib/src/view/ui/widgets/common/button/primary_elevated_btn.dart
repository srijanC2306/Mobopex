import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:flutter/material.dart';

class PrimaryElevatedBtn extends StatefulWidget {
  final String text;
  final Widget? icon;
  final VoidCallback? onClicked;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final double borderRadius;
  final MaterialStateProperty<Color?>? backgroundColor ;

  const PrimaryElevatedBtn(
    this.text,
    this.onClicked, {
    this.buttonStyle,
    this.textStyle,
    this.icon,
    this.backgroundColor,
    this.borderRadius = 8.0,
    Key? key,
  }) : super(key: key);

  @override
  _PrimaryElevatedBtnState createState() => _PrimaryElevatedBtnState();
}

class _PrimaryElevatedBtnState extends State<PrimaryElevatedBtn> {
  ButtonStyle get _buttonStyle {
    return widget.buttonStyle ??
        ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
          backgroundColor: widget.backgroundColor ?? MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorConstants.primaryColorDark;
              } else if (states.contains(MaterialState.disabled)) {
                return ColorConstants.primaryColorVeryLight;
              }
              return ColorConstants
                  .primaryColor; // Use the component's default.
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return widget.icon != null
        ? ElevatedButton.icon(
            onPressed: widget.onClicked,
            icon: widget.icon!,
            label: _text,
            style: _buttonStyle,
          )
        : SizedBox(
         width: double.infinity,
          child: ElevatedButton(
              onPressed: widget.onClicked,
              child: _text,
              style: _buttonStyle,
            ),
        );
  }

  Widget get _text {
    return Text(
      widget.text,
      style: widget.textStyle ??
          const TextStyle(
            fontSize: 24,
            color: ColorConstants.primaryColor,
            fontWeight: FontWeight.w400,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// Used to create button with fixed height and width
class FixedSizeElevatedBtn extends StatelessWidget {
  final String text;
  final VoidCallback? onClicked;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final double borderRadius;

  final double width;
  final double height;

  const FixedSizeElevatedBtn({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    this.onClicked,
    this.buttonStyle,
    this.textStyle,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: width, height: height),
      child: PrimaryElevatedBtn(
        text,
        onClicked,
        buttonStyle: buttonStyle,
        textStyle: textStyle,
        borderRadius: borderRadius,
      ),
    );
  }
}
