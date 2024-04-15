import 'package:MoboPex/src/model/data/api_error_model.dart';
import 'package:MoboPex/src/model/data/api_response.dart';
import 'package:MoboPex/src/view/resources/localization/translation_keys.dart';
import 'package:MoboPex/utils/logger.dart';
import 'package:get/get.dart' show Trans;

mixin ApiResponseListener {
  static const int httpOk = 200;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int maintenance = 403;
  static const int methodNotAllowed = 405;
  static const int internalServerError = 500;
  static const int badGateWay = 502;
  static const int serviceUnavailable = 503;
  static const int noInternetConnection = -101;
  static const int unknown = -102;
  static const int gatewayTimeout = 504 ;

  ApiErrorModel onHttpFailure(ApiResponse? response) {
    try {
      if (response != null && response.httpStatusCode != null) {
        int statusCode = response.httpStatusCode!;
        switch (statusCode) {
          case httpOk:
          case badRequest:
            return ApiErrorModel.fromJson(response.responseData);
          case noInternetConnection:
            return ApiErrorModel(
                TranslationKeys.noInternetConnection.tr, statusCode);
          case internalServerError:
          case methodNotAllowed:
          case badGateWay:
          case serviceUnavailable:
            return ApiErrorModel(TranslationKeys.technicalIssue.tr, statusCode);
          case maintenance:
            return ApiErrorModel(
                TranslationKeys.serverUnderMaintenance.tr, statusCode);
          default:
            return ApiErrorModel(TranslationKeys.technicalIssue.tr, statusCode);
        }
      }
    } catch (e) {
      Logger.e("ApiErrorResponse error", error: e);
    }

    return ApiErrorModel(TranslationKeys.somethingWentWrong.tr, unknown);
  }
}
