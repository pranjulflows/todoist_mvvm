import 'package:dio/dio.dart';
import 'package:todoist_mvvm/common/network/dio_exception.dart';
import 'package:todoist_mvvm/core/app_extension.dart';

abstract mixin class ApiHelper<T> {
  late final T data;

  Future<bool> _requestMethod(Future<Response<dynamic>> apiCallback) async {
    final Response response = await apiCallback;
    if (response.statusCode.success) {
      return true;
    } else {
      throw DioExceptions;
    }
  }

  ///Generic Method template for create item on server
  ///
  /// POST Request
  Future<bool> makePostRequest(Future<Response<dynamic>> apiCallback){
    return _requestMethod(apiCallback);
  }
  /// DELETE Request
  Future<bool> makeDeleteRequest(Future<Response<dynamic>> apiCallback){
    return _requestMethod(apiCallback);
  }

  /// PUT Request
  Future<bool> makePutRequest(Future<Response<dynamic>> apiCallback){
    return _requestMethod(apiCallback);
  }
  /// GET Request
  Future<bool> makeGetRequest(Future<Response<dynamic>> apiCallback){
    return _requestMethod(apiCallback);
  }
}
