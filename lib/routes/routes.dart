import 'package:get/get.dart';
import 'onboarding_routes.dart';

class Routes {
  Routes._();

  static List<GetPage> get() {
    final moduleRoutes = <GetPage>[];
    moduleRoutes.addAll(OnBoardingRoutes.routes);
    //moduleRoutes.addAll();  // Add all modules routes here
    //
    //
    return moduleRoutes;
  }
}
