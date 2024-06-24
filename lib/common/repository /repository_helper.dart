import 'package:dio/dio.dart';
import 'package:todoist_mvvm/common/network/api_result.dart';
import 'package:todoist_mvvm/common/network/dio_exception.dart';

mixin RepositoryHelper<T> {
  Future<ApiResult<List<T>>> checkItemsFailedOrSuccess(
    Future<List<T>> apiCallback,
  ) async {
    try {
      final List<T> items = await apiCallback;
      return ApiResult.success(items);
    } on DioException catch (e) {
      final errorResult = DioExceptions.fromDioError(e).message;
      return ApiResult.failure(errorResult);
    }
  }
}
