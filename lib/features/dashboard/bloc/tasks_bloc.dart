import 'package:bloc/bloc.dart' show Bloc, Emitter;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoist_mvvm/common/bloc/bloc_helper.dart';
import 'package:todoist_mvvm/data/model/task.dart';

part 'tasks_event.dart';

part 'tasks_bloc.freezed.dart';

typedef Emit = Emitter<GenericBlocState<Tasks>>;

class TasksBloc extends Bloc<TasksEvent, GenericBlocState<Tasks>> {
  TasksBloc() : super(GenericBlocState.empty()) {
    on<TasksEvent>(_init);
  }

  _init(TasksEvent event, Emit emit) {



  }
}
