import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceUtil {
  static final DeviceUtil _instance = DeviceUtil._internal();

  static late String _platform;
  static late String _osVersion;
  static late String _manufacturer;
  static late String _model;
  static late String _appVersion;
  static late String _buildNumber;
  static late String _deviceId;
  static late String _packageName;

  factory DeviceUtil.getInstance() {
    return _instance;
  }

  DeviceUtil._internal() {
    if (Platform.isAndroid) {
      DeviceInfoPlugin().androidInfo.then((androidInfo) {
        _platform = "Android";
        _osVersion = androidInfo.version.release
            .replaceAll(RegExp('[^\u0001-\u007F]'), '_');
        _manufacturer = androidInfo.manufacturer
            .replaceAll(RegExp('[^\u0001-\u007F]'), '_');
        _model =
            androidInfo.model.replaceAll(RegExp('[^\u0001-\u007F\']'), '_');
        _deviceId =
            androidInfo.androidId.replaceAll(RegExp('[^\u0001-\u007F\']'), '_');
      });
    }

    if (Platform.isIOS) {
      DeviceInfoPlugin().iosInfo.then((iosInfo) {
        _platform = "iOS";
        _osVersion =
            iosInfo.systemVersion.replaceAll(RegExp('[^\u0001-\u007F]'), '_');
        _manufacturer =
            iosInfo.name.replaceAll(RegExp('[^\u0001-\u007F]'), '_');
        _model = iosInfo.model.replaceAll(RegExp('[^\u0001-\u007F\']'), '_');
        _deviceId = iosInfo.identifierForVendor
            .replaceAll(RegExp('[^\u0001-\u007F\']'), '_');
      });
    }

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      _appVersion = packageInfo.version;
      _buildNumber = packageInfo.buildNumber;
      _packageName = packageInfo.packageName;
    });
  }

  String get platform => _platform;

  String get osVersion => _osVersion;

  String get manufacturer => _manufacturer;

  String get model => _model;

  String get appVersion => _appVersion;

  String get buildNumber => _buildNumber;

  String get deviceId => _deviceId;

  String get packageName => _packageName;
}
