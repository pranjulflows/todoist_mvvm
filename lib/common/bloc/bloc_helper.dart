import 'package:todoist_mvvm/common/bloc/generic_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist_mvvm/common/network/api_result.dart';

enum ApiOperation { select, create, update, delete }

typedef Emit<T> = Emitter<GenericBlocState<T>>;

mixin BlocHelper<T> {
  ApiOperation operation = ApiOperation.select;

  _checkSuccessOrFailure(ApiResult successOrFailure, Emit<T> emit) {
    successOrFailure.when(success: (_) {
      emit(GenericBlocState.success(null));
    }, failure: (String error) {
      emit(GenericBlocState.failure(error));
    });
  }

  Future<void> getItems(
      Future<ApiResult<List<T>>> apiCallback, Emit<T> emit) async {
    operation = ApiOperation.select;
    emit(GenericBlocState.loading());

    final successOrFailure = await apiCallback;

    successOrFailure.when(success: (items) {
      if (items.isEmpty) {
        emit(GenericBlocState.empty());
      } else {
        emit(GenericBlocState.success(items));
      }
    }, failure: (String error) {
      emit(GenericBlocState.failure(error));
    });
  }
}
