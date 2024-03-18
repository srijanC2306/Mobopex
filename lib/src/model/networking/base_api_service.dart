import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:MoboPex/src/model/data/api_response.dart';
import 'package:MoboPex/src/model/data/mapper.dart';
import 'package:MoboPex/src/model/networking/api_error_response.dart';
import 'package:MoboPex/utils/logger.dart';

abstract class BaseApiService {
  Future<ApiResponse<T>> postApiCall<T>(String url, Map<String, dynamic> body,
      {Options? options});

  Future<ApiResponse<T>> getApiCall<T>(String url,
      {Map<String, dynamic>? qParams,
      bool responseTypesAsBytes = false,
      Options? options});

  Future<ApiResponse<T>> upload<T>(String url, String path, String fileKey,
      String fileName, Function(int count, int total)? onUploadProgress,
      {Options? options, FormData? formData});

  Future<dynamic> download(String url, String path,
      {dynamic data,
      Function(int count, int total)? showDownloadProgress,
      Options? options});

  Future<ApiResponse<T>> handleDioError<T>(DioError e) {
    if (e.response != null) {
      Logger.e("DioException", error: e.error, stackTrace: e.stackTrace);
      return Future.value(ApiResponse.serverError(httpStatusCode: e.response!.statusCode));
    } else {
      Logger.e("DioException", error: e.error);
      if (e.toString().contains('SocketException')) {
        if (e.toString().contains('Network is unreachable')) {
          return Future.value(ApiResponse.networkError(
              httpStatusCode: ApiResponseListener.noInternetConnection));
        }
        return Future.value(ApiResponse.serverError(
            httpStatusCode: ApiResponseListener.internalServerError));
      }
      return Future.value(
          ApiResponse.serverError(httpStatusCode: ApiResponseListener.unknown));
    }
  }

  ApiResponse<T> handleDioResponse<T>(Response response) {
    final parsedResponse = MapperFactory.map<T>(response.data);
    if (parsedResponse == null) {
      return ApiResponse.serverError(
        httpStatusCode: response.statusCode!,
        responseData: parsedResponse,
      );
    }
    return ApiResponse.from(
      httpStatusCode: response.statusCode!,
      responseData: parsedResponse,
    );
  }

  Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    }
    return false;
  }
}
