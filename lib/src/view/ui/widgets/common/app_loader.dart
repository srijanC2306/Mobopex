import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';

class AppLoader extends BaseStatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.primaryColor),
      ),
    );
  }
}
