import 'package:MoboPex/src/model/data/api_response.dart';
import 'package:MoboPex/src/model/networking/api_error_response.dart';
import 'package:MoboPex/src/view/ui/widgets/common/app_loader.dart';
import 'package:MoboPex/src/view/base_stateful_widget.dart';

class BaseGetX extends GetxController with ApiResponseListener{
  bool _isLoaderVisible = false;

  void showLoader() {
    if (!_isLoaderVisible) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => Get.dialog(const AppLoader()));
      _isLoaderVisible = true;
    }
  }

  void hideLoader() {
    if (_isLoaderVisible) {
      Get.back();
      _isLoaderVisible = false;
    }
  }

  getApiError(ApiResponse apiResponse) => onHttpFailure(apiResponse);
}
