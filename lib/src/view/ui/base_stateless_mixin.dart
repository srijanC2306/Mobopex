import 'package:MoboPex/src/view/base_stateful_widget.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/resources.dart';

mixin StatelessPageWithAppBar on BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar as PreferredSizeWidget?,
      backgroundColor: backGroundColor,
      body: body,
    );
  }

  double get actionBarElevation => 0.5;

  String? get title => "";

  List<Widget>? get actions => null;

  Widget get body => isSafeAreaEnabled
      ? SafeArea(
          top: false,
          left: false,
          right: false,
          bottom: isSafeAreaBottom,
          child: content,
        )
      : content;

  Widget get content => Container();

  Widget? get leadingWidget => IconButton(
        visualDensity: VisualDensity.compact,
        splashRadius: 24,
        color: Colors.white,
        onPressed: onBackPressed ?? () => Get.back(),
        icon: backIcon,
      );

  Widget? get bottomNavigationBar => null;

  bool get isSafeAreaEnabled => true;

  bool get isSafeAreaBottom => true;

  Widget get appBar => AppBar(
        leading: leadingWidget,
        backgroundColor: ColorConstants.primaryColor,
        elevation: actionBarElevation,
        titleSpacing: titleSpacing,
        centerTitle: centerTitle,
        systemOverlayStyle: SystemUiOverlayStyle.light,

        title: Text(
          title!,
          style: const TextStyle(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: actions,
      );

  bool get centerTitle => false;

  Color get backGroundColor => Colors.white;

  Function()? get onBackPressed => null;

  Widget get backIcon => const Icon(
        Icons.chevron_left_rounded,
        size: 32.0,
      );

  double get titleSpacing => 0.0;
}

mixin StatelessPageWithoutAppBar on BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: body,
      ),
    );
  }

  Widget get body => Container();

  Color get backGroundColor => Colors.white;
}
