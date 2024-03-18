import 'package:MoboPex/src/view/base_stateful_widget.dart';
import 'package:MoboPex/src/view/resources/resources.dart';

class AppCheckBox extends BaseStatefulWidget {
  final MaterialStateProperty<Color>? fillColor;

  final bool? isChecked;
  final Color? activeColor;
  final Color? hoverColor;
  final Color? checkColor;
  final double? borderRadius;
  final Function(bool)? onChanged;
  final EdgeInsets? padding;

  const AppCheckBox({
    this.fillColor,
    this.isChecked,
    this.activeColor,
    this.hoverColor,
    this.checkColor,
    this.borderRadius,
    this.onChanged,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0.0),
      child: Checkbox(
          fillColor:
              widget.fillColor ?? MaterialStateProperty.all(Colors.white),
          activeColor: widget.activeColor ?? Colors.white,
          hoverColor: widget.hoverColor ?? ColorConstants.primaryColor,
          checkColor: widget.checkColor ?? Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 5.0)),
          value: isChecked,
          onChanged: onChanged),
    );
  }

  void onChanged(bool? value) {
    setState(() {
      widget.onChanged!(isChecked = !isChecked);
    });
  }
}
