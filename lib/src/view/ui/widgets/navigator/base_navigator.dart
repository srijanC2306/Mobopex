import 'package:flutter/material.dart';

class BaseNavigator extends StatelessWidget {
  final Widget Function(GlobalKey<NavigatorState>) builder;

   BaseNavigator({super.key, required this.builder});

  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: _navKey,
        onGenerateRoute: (_) =>
            MaterialPageRoute(builder: (_) => builder(_navKey)));
  }
}
