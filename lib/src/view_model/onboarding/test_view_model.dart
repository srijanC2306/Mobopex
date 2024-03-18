import 'package:MoboPex/src/model/data/api_error_model.dart';
import 'package:MoboPex/src/model/data/api_response.dart';
import 'package:MoboPex/src/model/data/onboarding/mock_list_model.dart';
import 'package:MoboPex/src/model/data/result_model.dart';
import 'package:MoboPex/src/model/networking/api_service.dart';
import 'package:MoboPex/src/model/networking/url_constants.dart';
import 'package:MoboPex/src/model/repository/test_repository.dart';
import 'package:MoboPex/src/view_model/base_getx.dart';
import 'package:get/get.dart';

class TestViewModel extends BaseGetX {
  final ApiService apiService = Get.find<ApiService>();

  final Rx<ApiStatus> apiStatus = ApiStatus.empty.obs;
  ApiErrorModel apiError = ApiErrorModel("", -1);

  List<Mylist> myList = <Mylist>[]; // => observables

  final repository = TestRepository(); //For Offline Use

  @override
  void onInit() {
    super.onInit();
    //getMockList();
    getOfflineMockList();
  }

  // @override
  // void onReady() {
  //   super.onInit();
  //   getMockList();
  // }

  Future<void> getMockList() async {
    apiStatus.value = ApiStatus.loading;

    //showLoader();

    await Future.delayed(
        const Duration(seconds: 2)); //For loader testing. Remove this
    ApiResponse apiResponse =
        await apiService.getApiCall<MockListModel>(UrlConstants.mockListUrl);

    //hideLoader();

    if (apiResponse.isSuccess) {
      myList = apiResponse.responseData?.mylist ?? [];
    } else {
      // if required use this else condition. Otherwise remove it.
      //1) Show in toast
      //2) Or set to apiError for showing in primary, secondary texts on UI
      apiError = getApiError(apiResponse);
    }
    apiStatus.value = myList.isEmpty && apiResponse.isSuccess
        ? ApiStatus.empty
        : apiResponse.status;
  }

  // Use this for Offline Storage
  Future<void> getOfflineMockList() async {
    apiStatus.value = ApiStatus.loading;

    //showLoader();

    // await Future.delayed(
    //     const Duration(seconds: 2)); //For loader testing. Remove this
    ApiResponse apiResponse = await repository.getMyList();

    //hideLoader();
    if (apiResponse.isSuccess) {
      myList = apiResponse.responseData?.mylist ?? [];
    } else {
      // if required use this else condition. Otherwise remove it.
      //1) Show in toast
      //2) Or set to apiError for showing in primary, secondary texts on UI
      apiError = getApiError(apiResponse);
    }
    apiStatus.value = apiResponse.isOfflineData
        ? ApiStatus.success
        : myList.isEmpty && apiResponse.isSuccess
            ? ApiStatus.empty
            : apiResponse.status;
  }
}
