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
  final RxList<DailyTasksListViewModel> dailyTasks =
      RxList<DailyTasksListViewModel>();
  final RxBool isDataFetched = false.obs;

  @override
  void onInit(){
    getDailyTask();
    super.onInit();
  }
  Future<void> onAddTaskTapped() async {
    final result = await _repository.createDailyTask(dto: _dto());

    dailyTasks.add(
      DailyTasksListViewModel(
        id: result,
        isDone: false,
        taskTitle: newTaskTextController.text,
      ),
    );
    newTaskTextController.clear();
  }

  void onTaskCheckboxTaped(bool? value, DailyTasksListViewModel task) {
    print(dailyTasks[dailyTasks.indexOf(task)].isDone);
    dailyTasks[dailyTasks.indexOf(task)].copyWith(isDone: value);
    print(dailyTasks[dailyTasks.indexOf(task)].isDone);
  }

  DailyTasksListDto _dto() =>
      DailyTasksListDto(taskTitle: newTaskTextController.text.trim());

  Future<void> getDailyTask() async {
    isDataFetched(false);
    final result = await _repository.getDailyTask();

    dailyTasks.addAll(result);
    await Future.delayed(Duration(seconds: 2));

    isDataFetched(true);
  }
}
