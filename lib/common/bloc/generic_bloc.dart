import 'package:flutter/cupertino.dart';

enum Status { empty, loading, failure, success }

/// Generic bloc implementation
///
@immutable
class GenericBlocState<T> {
  final List<T>? data;
  final String? error;
  final Status status;

  const GenericBlocState({this.data, this.error, required this.status});

  factory GenericBlocState.empty() =>
      const GenericBlocState(status: Status.empty);

  factory GenericBlocState.loading() =>
      const GenericBlocState(status: Status.loading);

  factory GenericBlocState.failure(String error) =>
      GenericBlocState(status: Status.failure, error: error);

  factory GenericBlocState.success(List<T>? data) =>
      GenericBlocState(status: Status.success, data: data);
}
