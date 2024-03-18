import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/ui/widgets/common/toggle/toogle.dart';

class LoginHeader extends BaseStatelessWidget{
  final bool toggleValue ;
  final Function(bool) onChanged ;
  const LoginHeader({super.key , required this.toggleValue , required this.onChanged});


  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
       // const IconWithText(text: "Back",) ,
        Toggle(value:toggleValue  ,
          onChanged: onChanged,)
      ],
    );
  }

}