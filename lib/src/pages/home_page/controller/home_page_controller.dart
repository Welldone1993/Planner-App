import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:planner_project/src/pages/home_page/model/daily_task_dto.dart';
import 'package:planner_project/src/pages/home_page/repository/home_page_repository.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/daily_tasks_list_view_model.dart';

class HomePageController extends GetxController {
  final HomepageRepository _repository = HomepageRepository();
  final Rx<DateTime> selectedDay = Rx<DateTime>(DateTime.now());
  final Rx<CalendarFormat> calendarFormat =
      Rx<CalendarFormat>(CalendarFormat.week);
  final TextEditingController newTaskTextController = TextEditingController();
  final RxList<Rx<DailyTasksListViewModel>> dailyTasks =
      RxList<Rx<DailyTasksListViewModel>>();

  Future<void> onAddTaskTapped() async {
    final result = await _repository.createDailyTask(dto: _dto());
    print(result);

    dailyTasks.add(
      DailyTasksListViewModel(
        id: dailyTasks.length,
        isDone: false,
        taskTitle: result,
      ).obs,
    );
    newTaskTextController.clear();
  }

  void onTaskCheckboxTaped(bool? value, Rx<DailyTasksListViewModel> task) {
    print(dailyTasks[dailyTasks.indexOf(task)].value.isDone);
    dailyTasks[dailyTasks.indexOf(task)].value.copyWith(isDone: value);
    print(dailyTasks[dailyTasks.indexOf(task)].value.isDone);
  }

  DailyTasksListDto _dto() =>
      DailyTasksListDto(taskTitle: newTaskTextController.text.trim());
}
