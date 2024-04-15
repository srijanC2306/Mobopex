import 'package:MoboPex/src/core/theme/custom_theme_extension.dart';
import '../../../base_stateless_widget.dart';
import 'back_button.dart';

class NavigatedPage extends StatelessWidget {
  final Widget child;
  final String? title;
  final Color appBarColor;
  final Color backgroundColor;
  final bool includesBorder;
  final bool centerTitle;
  final List<Widget> actions;

  const NavigatedPage({
    super.key,
    required this.child,
    this.appBarColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.title,
    this.includesBorder = false,
    this.centerTitle = true,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: centerTitle,
        actions: actions,
        leading: BackNavigationButton(navigator: Navigator.of(context)),
        backgroundColor: appBarColor,
        elevation: 0,
        title: (title != null)
            ? Text(
                title!,
                style: BaseTextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w600,
                ),
              )
            : null,
        shape: includesBorder
            ? Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300.withOpacity(0.10),
                  width: 1,
                ),
              )
            : null,
      ),
      backgroundColor: backgroundColor,
      body: child,
    );
  }
}
