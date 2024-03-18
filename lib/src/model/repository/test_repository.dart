import 'package:MoboPex/src/model/data/api_response.dart';
import 'package:MoboPex/src/model/data/onboarding/mock_list_model.dart';
import 'package:MoboPex/src/model/networking/api_service.dart';
import 'package:MoboPex/src/model/networking/url_constants.dart';
import 'package:MoboPex/src/model/repository/database/dao_session.dart';
import 'package:MoboPex/src/model/repository/database/test_cache_dao.dart';
import 'package:MoboPex/utils/utils.dart';
import 'package:get/get.dart';

class TestRepository {
  final ApiService apiService = Get.find<ApiService>();
  final TestCacheDao testCacheDao = Get.find<DaoSession>().testCacheDao;

  Future<ApiResponse> getMyList() async {
    List<Mylist> list = await testCacheDao.getAll();
    ApiResponse apiResponse;
    if (list.isEmpty) {
      apiResponse =
          await apiService.getApiCall<MockListModel>(UrlConstants.mockListUrl);
      await testCacheDao.insertAll(apiResponse.responseData?.mylist ?? []);
    } else {
      Logger.i("MockList Offline Data Available");
      apiResponse = ApiResponse.from(
        isOfflineData: true,
        responseData: MockListModel(mylist: list),
      );
    }
    return apiResponse;
  }
}
