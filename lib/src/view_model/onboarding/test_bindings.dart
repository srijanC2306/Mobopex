import 'package:get/get.dart';
import 'package:MoboPex/src/view_model/onboarding/test_view_model.dart';

class TestBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(TestViewModel());
  }
}
