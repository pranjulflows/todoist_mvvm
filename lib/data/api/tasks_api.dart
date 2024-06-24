import 'package:injectable/injectable.dart';
import 'package:todoist_mvvm/common/network/api_config.dart';
import 'package:todoist_mvvm/common/network/api_helper.dart';
import 'package:todoist_mvvm/common/network/dio_client.dart';
import 'package:todoist_mvvm/data/model/task.dart';

@injectable
class TasksApi with ApiHelper<Tasks> {
  DioClient dioClient;

  TasksApi({required this.dioClient});

  /// Get Tasks List
  Future<List<Tasks>> getTasks() async {
    return await makeGetRequest(
        dioClient.dio.get(ApiConfig.tasks), Tasks.fromJson);
  }
}
