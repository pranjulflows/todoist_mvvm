import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todoist_mvvm/common/network/dio_exception.dart';
import 'package:todoist_mvvm/core/app_extension.dart';
import 'package:todoist_mvvm/data/model/task.dart';

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
  Future<bool> makePostRequest(Future<Response<dynamic>> apiCallback) {
    return _requestMethod(apiCallback);
  }

  /// DELETE Request
  Future<bool> makeDeleteRequest(Future<Response<dynamic>> apiCallback) {
    return _requestMethod(apiCallback);
  }

  /// PUT Request
  Future<bool> makePutRequest(Future<Response<dynamic>> apiCallback) {
    return _requestMethod(apiCallback);
  }

  /// GET Request
  Future<List<T>> makeGetRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response response = await apiCallback;
    if (response.statusCode == 200) {
      final tasks = json.encode(response.data);
      final List<T> items = List<T>.from(
          json.decode(tasks).map((items) => getJsonCallback(items)));
      return items;
    } else {
      throw DioExceptions;
    }
  }
}
