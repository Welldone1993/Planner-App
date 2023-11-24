import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controller/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Today taskssss'),
          centerTitle: true,
        ),
        body: Center(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _calendar(),
                _addNewTaskPart(),
                if (controller.dailyTasks.isNotEmpty)
                  ...controller.dailyTasks.map(
                    (task) => Row(
                      children: [
                        Checkbox(
                          value: task.value.isDone,
                          onChanged: (value) {
                            controller.onTaskCheckboxTaped(value, task);
                          },
                        ),
                        Text(task.value.taskTitle),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      );

  Widget _addNewTaskPart() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.newTaskTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                controller.onAddTaskTapped();
                //   TODO: add New Task
              },
            )
          ],
        ),
      );

  Widget _calendar() => TableCalendar(
        onPageChanged: (focusedDay) {
          print(focusedDay);
        },
        onFormatChanged: (format) {
          // TODO: on change format tap method
          controller.calendarFormat.value = format;
          print(format);
        },
        onDisabledDayTapped: (day) {
          controller.selectedDay.value = day;
          print(day.month);
          // TODO: make that day task, visible
        },
        onDaySelected: (selectedDay, focusedDay) {
          print(selectedDay);
          print(focusedDay);
          // TODO: go to today tasks details
        },
        daysOfWeekHeight: 50,
        calendarFormat: controller.calendarFormat.value,
        focusedDay: controller.selectedDay.value,
        firstDay: controller.selectedDay.value,
        lastDay: controller.selectedDay.value,
        startingDayOfWeek: StartingDayOfWeek.saturday,
        weekendDays: const [DateTime.thursday, DateTime.friday],
        onHeaderTapped: (focusedDay) {
          print(focusedDay);
        },
      );
}
