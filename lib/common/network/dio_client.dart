import 'package:dio/dio.dart' show Dio, ResponseType;
import 'package:todoist_mvvm/common/network/api_config.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio
      ..options.baseUrl = ApiConfig.baseUrl
      ..options.headers = ApiConfig.header
      ..options.connectTimeout = ApiConfig.connectionTimeout
      ..options.receiveTimeout = ApiConfig.receiveTimeout
      ..options.responseType = ResponseType.json;
      // ..interceptors.add(DioInterceptor());
  }
}
