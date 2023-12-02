import 'package:dio/dio.dart';
import 'package:planner_project/src/pages/home_page/model/daily_task_dto.dart';

import '../model/daily_tasks_list_view_model.dart';

class HomepageRepository {
  final _dio = Dio();

  Future<int> createDailyTask({
    required DailyTasksListDto dto,
  }) async {
    final response = await _dio.post(
      'http://localhost:3000/tasks',
      data: dto.toJson(),
    );

    return response.data['id'];
  }

  Future<List<DailyTasksListViewModel>> getDailyTask() async {
    final response = await _dio.get(
      'http://localhost:3000/tasks',
    );

    List<DailyTasksListViewModel> data = (response.data as List)
        .map((e) => DailyTasksListViewModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return data;
  }
}
