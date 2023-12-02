import 'package:planner_project/src/pages/home_page/model/daily_task_dto.dart';

class HomepageRepository {
  Future<String> createDailyTask({
    required DailyTasksListDto dto,
  }) async {
    await Future.delayed(Duration(seconds: 1));

    print(dto.taskTitle);
    return '${dto.taskTitle} + repo return';

  }
}
