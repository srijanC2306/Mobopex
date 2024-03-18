
import 'package:MoboPex/src/view/base_stateless_widget.dart';

import '../../../../../routes/route_constants.dart';
import '../../../resources/asset_constants.dart';
import '../../../resources/color_constants.dart';
import '../../../resources/localization/translation_keys.dart';
import '../../base_stateless_mixin.dart';
import '../../widgets/common/button/primary_elevated_btn.dart';

class WelcomeScreen extends BaseStatelessWidget with StatelessPageWithAppBar {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  String? get title => "Welcome"; // Use Translations always


  @override
  // TODO: implement appBar
  Widget get appBar => AppBar();
  @override
  Widget? get leadingWidget => null;

  @override
  double get titleSpacing => 15.0;
  @override
  // TODO: implement backGroundColor
  Color get backGroundColor => ColorConstants.primaryColor;
  @override
  Widget get content => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 36.0),
    child: Column(
      children: [
        // Use segregated widgets to look more clean and readable. Create separate widget class for large UI components
        const Spacer(),
        _header,
       const Spacer(),
       _welcomeTxt ,
        const SizedBox(height: 60.0) ,
        _button,
        const SizedBox(height: 72.0),
      ],
    ),
  );

  Widget get _header =>  SizedBox(
      height: 230,
      child: Image.asset( AssetConstants.icLogo));

  Widget get _welcomeTxt => const Text(TranslationKeys.welcomeTxt  ,style: BaseTextStyle(color: Colors.white, fontSize: 22),);

  // Use your view model for all business logic and routing. This screen is a very basic one which doesn't require view model.
  Widget get _button => Center(
    child: PrimaryElevatedBtn(
      borderRadius: 0,
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states){
        return Colors.white;
      }),

        TranslationKeys.getStarted, // Use Translations always
            () => Get.offAllNamed(RouteConstants.loginRoute,
            arguments: "Some Arguments")),
  );
}
