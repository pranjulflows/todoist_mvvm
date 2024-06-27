import 'package:bloc/bloc.dart' show Bloc, Emitter;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todoist_mvvm/common/bloc/bloc_helper.dart';
import 'package:todoist_mvvm/common/bloc/generic_bloc.dart';
import 'package:todoist_mvvm/data/model/task.dart';
import 'package:todoist_mvvm/repository/todoTask/task_repository.dart';

part 'tasks_event.dart';

part 'tasks_bloc.freezed.dart';

typedef Emit = Emitter<GenericBlocState<Tasks>>;

@injectable
class TasksBloc extends Bloc<TasksEvent, GenericBlocState<Tasks>>
    with BlocHelper<Tasks> {
  TasksBloc(this.taskRepository) : super(GenericBlocState.empty()) {
    on<TasksEvent>(_getTasks);
  }

  final TaskRepository taskRepository;

  Future<void> _getTasks(TasksEvent event, Emit emit) async {
    await getItems(taskRepository.getTasks(), emit);
  }
}
