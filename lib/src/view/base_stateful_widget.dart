import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MoboPex/src/view/ui/base_content_mixin.dart';
import 'package:get/get.dart';

export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:flutter/services.dart';

abstract class BaseStatefulWidget extends StatefulWidget
    with BaseContentWidget {
  const BaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseState<Page extends BaseStatefulWidget> extends State<Page> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ScrollController? scrollController;

  double get screenHeight => Get.height;

  double get screenWidth => Get.width;

  double get statusBarHeight => MediaQuery.of(context).padding.top;

  double get actionBarHeight => AppBar().preferredSize.height;

  //true means keyboard resize, false means overlap on the screen
  bool get resizeToAvoidBottomInset => false;

  Color get backGroundColor => context.theme.colorScheme.background;

  Widget body() {
    return const SizedBox.shrink();
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? floatingActionButton() {
    return null;
  }

  FloatingActionButtonLocation getFloatingActionButtonLocation() {
    return FloatingActionButtonLocation.endFloat;
  }

  hideSoftKeyboard() async {
    FocusManager.instance.primaryFocus!.unfocus();
    return await Future.delayed(const Duration(milliseconds: 100));
  }

  /// blocks rotation; sets orientation to: portrait
  void portraitModeOnly() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  void portraitAndLandscapeModes({bool withEnabledToolBar = true}) {
    if (withEnabledToolBar) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
