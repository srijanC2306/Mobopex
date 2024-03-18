
import '../../base_stateless_widget.dart';

class Test_Screen extends BaseStatelessWidget {
  const Test_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Text("Hello World"),
      ),
    );
  }
}
