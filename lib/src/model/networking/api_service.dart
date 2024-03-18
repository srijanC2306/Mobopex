import 'package:dio/dio.dart';
import 'package:MoboPex/environment.dart';
import 'package:MoboPex/src/model/data/api_response.dart';
import 'package:MoboPex/src/model/networking/api_error_response.dart';
import 'package:MoboPex/src/model/networking/base_api_service.dart';
import 'package:MoboPex/utils/logger.dart';

import 'dio_interceptor.dart';

class ApiService extends BaseApiService {
  final int _defaultConnectTimeout = 30 * 1000; // 30 sec
  final int _defaultReceiveTimeout = 60 * 1000; // 60 sec

  late Dio _dio;

  static final ApiService _instance = ApiService._internal();

  factory ApiService.getInstance() {
    return _instance;
  }

  ApiService._internal() {
    _dio = Dio()
      ..options.connectTimeout =  Duration(milliseconds: _defaultConnectTimeout)
      ..options.receiveTimeout = Duration(milliseconds: _defaultReceiveTimeout)
      ..interceptors.add(DioInterceptor());
  }

  @override
  Future<ApiResponse<T>> postApiCall<T>(String url, Map<String, dynamic> body,
      {Options? options}) async {
    url = "${Environment.staticBaseUrl}$url";
    Logger.i(body, tag: "REQUEST", isJson: true);
    Logger.i(url, tag: "POST URL");

    if (!(await isInternetConnected())) {
      return Future.value(ApiResponse.networkError(
          httpStatusCode: ApiResponseListener.noInternetConnection));
    }

    try {
      final Response response =
          await _dio.post(url, data: body, options: options);
      Logger.i("${response.statusCode}", tag: "RESPONSE CODE");
      Logger.i(response.data, tag: "RESPONSE", isJson: true);
      return Future.value(handleDioResponse(response));
    } on DioError catch (e) {
      return super.handleDioError(e);
    }
  }

  @override
  Future<ApiResponse<T>> getApiCall<T>(String url,
      {Map<String, dynamic>? qParams,
      bool responseTypesAsBytes = false,
      Options? options}) async {
    url = "${Environment.staticBaseUrl}$url";
    Logger.i(qParams, tag: "REQUEST PARAMS", isJson: true);
    Logger.i(url, tag: "GET URL");

    if (!(await isInternetConnected())) {
      return Future.value(ApiResponse.networkError(
          httpStatusCode: ApiResponseListener.noInternetConnection));
    }
    Response response;
    try {
      if (responseTypesAsBytes) {
        Options ops = options ?? Options();
        ops.responseType = ResponseType.bytes;
        response = await _dio.get(url, queryParameters: qParams, options: ops);
      } else {
        response =
            await _dio.get(url, queryParameters: qParams, options: options);
      }
      Logger.i("${response.statusCode}", tag: "RESPONSE CODE");
      Logger.i(response.data, tag: "RESPONSE", isJson: true);
      return Future.value(handleDioResponse(response));
    } on DioError catch (e) {
      return handleDioError(e);
    }
  }

  @override
  Future<ApiResponse<T>> upload<T>(String url, String path, String fileKey,
      String fileName, Function(int count, int total)? onUploadProgress,
      {Options? options, FormData? formData}) async {
    if (!(await isInternetConnected())) {
      return Future.value(ApiResponse.networkError(
          httpStatusCode: ApiResponseListener.noInternetConnection));
    }

    try {
      url = "${Environment.staticBaseUrl}$url";
      final fd = formData ??
          FormData.fromMap({
            fileKey: await MultipartFile.fromFile(path, filename: fileName),
          });
      final response = await _dio.post(url,
          data: fd, onSendProgress: onUploadProgress, options: options);
      return Future.value(handleDioResponse(response));
    } on DioError catch (e) {
      return super.handleDioError(e);
    }
  }

  @override
  Future<dynamic> download(String url, String path,
      {dynamic data,
      Function(int count, int total)? showDownloadProgress,
      Options? options}) async {
    if (!(await isInternetConnected())) {
      return Future.value(ApiResponse.networkError(
          httpStatusCode: ApiResponseListener.noInternetConnection));
    }

    try {
      url = "${Environment.staticBaseUrl}$url";
      final response = await _dio.download(url, path,
          data: data,
          options: options,
          onReceiveProgress: showDownloadProgress);
      return Future.value(ApiResponse.from(
          responseData: response, httpStatusCode: response.statusCode));
    } on DioError catch (e) {
      return super.handleDioError(e);
    }
  }
}
