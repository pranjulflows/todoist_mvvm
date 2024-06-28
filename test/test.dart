import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todoist_mvvm/data/api/tasks_api.dart';
import 'package:todoist_mvvm/data/model/task.dart';

import 'test_configs.dart';

void main() {
  test('test for api response for tasks list!', () async {
    final fakeTaskApi = FakeTaskApi();
    final response = await fakeTaskApi.getTasks();

    expect(
        response,
        List<Tasks>.from(
            json.decode(taskListData).map((tasks) => Tasks.fromJson(tasks))));
  });
}

class FakeTaskApi extends Fake implements TasksApi {
  @override
  Future<List<Tasks>> getTasks() {
    const tasks = taskListData;
    return Future.value(List<Tasks>.from(
        json.decode(tasks).map((tasks) => Tasks.fromJson(tasks))));
    // return List<T>.from(jsonDecode(taskListData).map(()=>));
  }
}
