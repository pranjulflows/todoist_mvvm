import 'package:injectable/injectable.dart';
import 'package:todoist_mvvm/common/network/api_helper.dart';
import 'package:todoist_mvvm/common/network/api_result.dart';
import 'package:todoist_mvvm/common/repository%20/repository_helper.dart';
import 'package:todoist_mvvm/data/api/tasks_api.dart';
import 'package:todoist_mvvm/data/model/task.dart';
import 'package:todoist_mvvm/mapper/task_mapper.dart';

@injectable
class TaskRepository extends ITaskRepository with RepositoryHelper<Tasks> {
  TasksApi tasksApi;

  TaskRepository({required this.tasksApi});

  @override
  Future<ApiResult<List<Tasks>>> getTasks() {
    return checkItemsFailedOrSuccess(tasksApi.getTasks());
  }
}
