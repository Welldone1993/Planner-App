import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/daily_tasks_list_view_model.dart';

class HomePageController extends GetxController {
  final Rx<DateTime> selectedDay = Rx<DateTime>(DateTime.now());
  final Rx<CalendarFormat> calendarFormat =
      Rx<CalendarFormat>(CalendarFormat.week);
  final TextEditingController newTaskTextController = TextEditingController();
  final RxList<Rx<DailyTasksListViewModel>> dailyTasks =
      RxList<Rx<DailyTasksListViewModel>>();

  void onAddTaskTapped() {
    dailyTasks.add(
      DailyTasksListViewModel(
        id: dailyTasks.length,
        isDone: false,
        taskTitle: newTaskTextController.text,
      ).obs,
    );
    newTaskTextController.clear();
  }

  void onTaskCheckboxTaped(bool? value, Rx<DailyTasksListViewModel> task) {
    print(dailyTasks[dailyTasks.indexOf(task)].value.isDone);
    dailyTasks[dailyTasks.indexOf(task)].value.copyWith(isDone: value);
    print(dailyTasks[dailyTasks.indexOf(task)].value.isDone);
  }
}
