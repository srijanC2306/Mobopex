import 'package:flutter/material.dart';

class PrimaryOutlinedBtn extends StatelessWidget {
  final String _text;
  final VoidCallback? _onClicked;
  final Color color;
  final TextStyle? textStyle;
  final Color? bgColor;

  const PrimaryOutlinedBtn(
    this._text,
    this._onClicked, {
    super.key,
    this.color = Colors.black,
    this.textStyle,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _onClicked,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => BorderSide(
            color: _onClicked == null ? color.withOpacity(0.6) : color,
            width: 0.8,
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return bgColor ?? Colors.transparent;
          },
        ),
      ),
      child: Text(
        _text,
        style: TextStyle(
          fontSize: 14,
          color: _onClicked == null ? color.withOpacity(0.6) : color,
          fontWeight: FontWeight.w700,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
