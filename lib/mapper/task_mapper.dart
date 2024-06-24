import 'package:injectable/injectable.dart';
import 'package:todoist_mvvm/common/network/api_result.dart';
import 'package:todoist_mvvm/data/model/task.dart';


abstract class ITaskRepository {
  Future<ApiResult<List<Tasks>>> getTasks();
}
