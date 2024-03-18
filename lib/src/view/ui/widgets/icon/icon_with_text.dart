import 'package:MoboPex/src/view/base_stateless_widget.dart';

class IconWithText extends BaseStatelessWidget {
  final String text;
  final bool isIcon ;
  final IconData? icon ;

  const IconWithText({super.key, required this.text ,  this.icon , this.isIcon = false });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if(isIcon)...[
         Icon(icon ??Icons.arrow_back_ios_new_outlined),
        const SizedBox(width: 4.0),
        ],
        Text(
          text,
          style: const BaseTextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
