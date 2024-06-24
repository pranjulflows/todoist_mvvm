import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todoist_mvvm/common/network/api_config.dart';
import 'package:todoist_mvvm/common/network/dio_interceptor.dart';

@module
abstract class DioProvider {
  @singleton
  Dio dio() {
    Dio dio = Dio();
    dio
      ..options.baseUrl = ApiConfig.baseUrl
      ..options.headers = ApiConfig.header
      ..options.connectTimeout = ApiConfig.connectionTimeout
      ..options.receiveTimeout = ApiConfig.receiveTimeout
      ..interceptors.add(DioInterceptor())
      ..options.responseType = ResponseType.json;
    return dio;
  }
}
