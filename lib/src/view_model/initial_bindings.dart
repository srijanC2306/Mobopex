
import 'package:get/get.dart';
import 'package:MoboPex/src/model/networking/api_service.dart';
import 'package:MoboPex/src/view/resources/app_preferences.dart';
import 'package:MoboPex/utils/device_util.dart';

class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    final appPreferences = AppPreferences.instance;
    await appPreferences.init();
    Get.put<AppPreferences>(appPreferences, permanent: true);
    Get.put<ApiService>(ApiService.getInstance(), permanent: true);
    Get.put<DeviceUtil>(DeviceUtil.getInstance(), permanent: true);
   // await _initDatabase();
  }

  /*_initDatabase() async {
    try {
      final daoSession = await DbProvider.instance.getDaoSession("<KEY>");
      Get.put<DaoSession>(daoSession, permanent: true);
    } catch (e) {
      Logger.e(
        "_initDatabase() failed",
        error: e,
      );
    }
  }*/
}
