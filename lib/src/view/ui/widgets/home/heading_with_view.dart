import 'package:MoboPex/src/view/ui/widgets/navigator/base_navigator.dart';

import '../../../base_stateless_widget.dart';
import '../../../resources/color_constants.dart';
import '../../screens/navigation/home/top_pick_details.dart';

class HeadingWithView extends StatelessWidget {
  final String heading;
  final GlobalKey<NavigatorState> navKey ;

 const  HeadingWithView({required this.heading,
   required this.navKey ,
   super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          navKey.currentState!
              .push(MaterialPageRoute(builder: (_) => TopPickPageDetails(navigatorState: Navigator.of(context),)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(heading,
                style: const BaseTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorConstants.primaryColor)),
            const Text(
              'See All',
              style: BaseTextStyle(
                  color: ColorConstants.textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
    );
  }
}
