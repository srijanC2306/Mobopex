import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MoboPex/src/view/resources/resources.dart';

/// *  textInputType - The type of information for which to optimize the text input control.
/// *  hintText - Text that suggests what sort of input the field accepts.
/// *  prefixIcon - Pass Icon if required
/// *  defaultText - If there is predefined value is there for a text field
/// *  focusNode - Currently focus node
/// *  obscureText - Is Password field?
/// *  controller - Text controller
/// *  functionValidate - Validation function(currently I have used to check empty field)
/// *  parametersValidate - Value to validate
/// *  actionKeyboard - Keyboard action eg. next, done, search, etc
/// *  onSubmitField - Done click action
/// *  onFieldTap - On focus on TextField
class AppTextFormField extends StatefulWidget {
  final TextInputType? textInputType;
  final TextAlign textAlign;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? defaultText;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? functionValidate;
  final void Function(String)? functionOnTextChange;
  final String? parametersValidate;
  final TextInputAction actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final String? errorText;
  final int? maxLength;
  final int? maxLines;
  final bool isOutlineBorder;
  final Color enabledBorderColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool isEnabled;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextFormField(
      {Key? key,
      required this.hintText,
      this.focusNode,
      this.textInputType,
      this.textAlign = TextAlign.start,
      this.defaultText,
      this.obscureText = false,
      this.controller,
      this.functionValidate,
      this.functionOnTextChange,
      this.parametersValidate,
      this.actionKeyboard = TextInputAction.next,
      this.onSubmitField,
      this.onFieldTap,
      this.prefixIcon,
      this.suffixIcon,
      this.errorText,
      this.maxLength,
      this.maxLines,
      this.isOutlineBorder = false,
      this.enabledBorderColor = ColorConstants.greyScaleDark4,
      this.contentPadding,
      this.isEnabled = true,
      this.inputFormatters})
      : super(key: key);

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  double bottomPaddingToError = 12;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // accentColor: Palette.colorActionableText,
        primaryColor: ColorConstants.greyScaleDark4,
      ),
      child: TextFormField(
        cursorColor: ColorConstants.primaryColor,
        obscureText: widget.obscureText,
        keyboardType: widget.textInputType,
        textAlign: widget.textAlign,
        textInputAction: widget.actionKeyboard,
        focusNode: widget.focusNode,
        enabled: widget.isEnabled,
        maxLength: widget.maxLength,
        maxLines: widget.obscureText ? 1 : widget.maxLines,
        inputFormatters: widget.inputFormatters ?? [],
        style: const TextStyle(
          color: ColorConstants.greyScaleDark0,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.5,
        ),
        initialValue: widget.defaultText,
        decoration: InputDecoration(
            //counterStyle: Put Style here,
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 30,
              minHeight: 15,
            ),
            suffixIcon: widget.suffixIcon,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 30,
              minHeight: 15,
            ),
            hintText: widget.hintText,
            enabledBorder: widget.isOutlineBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.enabledBorderColor, width: 0.8),
                  )
                : UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.enabledBorderColor, width: 0.8),
                  ),
            focusedBorder: widget.isOutlineBorder
                ? const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorConstants.primaryColor, width: 1),
                  )
                : const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorConstants.primaryColor, width: 1),
                  ),
            /*enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.colorPrimary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.colorPrimary),
          ),*/
            hintStyle: const TextStyle(
              color: ColorConstants.greyScaleDark4,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.8,
            ),
            contentPadding: widget.contentPadding ??
                EdgeInsets.only(
                    top: 12,
                    bottom: bottomPaddingToError,
                    left: 0.0,
                    right: 0.0),
            isDense: true,
            errorStyle: const TextStyle(
              color: ColorConstants.statusColoursRed0,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.8,
            ),
            errorBorder: widget.isOutlineBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.enabledBorderColor, width: 0.8),
                  )
                : UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.enabledBorderColor, width: 0.8),
                  ),
            focusedErrorBorder: widget.isOutlineBorder
                ? OutlineInputBorder(
                    borderSide:
                        BorderSide(color: widget.enabledBorderColor, width: 1),
                  )
                : UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: widget.enabledBorderColor, width: 1),
                  ),
            errorText: widget.errorText
            /*errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.colorPrimary),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.colorPrimary),
          ),*/
            ),
        controller: widget.controller,
        validator: widget.functionValidate,
        onFieldSubmitted: (value) {
          if (widget.onSubmitField != null) widget.onSubmitField!();
        },
        onTap: () {
          if (widget.onFieldTap != null) widget.onFieldTap!();
        },
        onChanged: widget.functionOnTextChange,
      ),
    );
  }

  String? commonValidation(String value, String messageError) {
    var required = requiredValidator(value, messageError);
    if (required != null) {
      return required;
    }
    return null;
  }

  String? requiredValidator(value, messageError) {
    if (value.isEmpty) {
      return messageError;
    }
    return null;
  }

  void changeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
