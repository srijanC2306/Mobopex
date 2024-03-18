import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Toggle extends StatelessWidget{
  final bool value ;
  final Function(bool) onChanged ;
  const Toggle({required this.value , required this.onChanged ,  super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        value: value,
        onToggle: onChanged ,
    activeColor: Colors.white,
    toggleSize: 35,
    borderRadius: 100,

    activeToggleColor: ColorConstants.primaryColor,
    activeIcon: const Text("R" , style: BaseTextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.w900),),
    inactiveIcon: const Text("W" , style: BaseTextStyle(color: ColorConstants.primaryColor , fontSize: 30 , fontWeight: FontWeight.w900),),

    inactiveColor: ColorConstants.primaryColor,


    );
  }
}