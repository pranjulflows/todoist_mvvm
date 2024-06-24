part of 'tasks_bloc.dart';

@freezed
abstract class TasksEvent with _$TasksEvent {
  const factory TasksEvent.fetched() = _Fetched;
  const factory TasksEvent.created() = _Created;
  const factory TasksEvent.updated() = _Updated;
  const factory TasksEvent.deleted() = _deleted;
}
