import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Today taskssss'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TableCalendar(
                  onDisabledDayTapped: (day) {
                    print(day);
                  // TODO: make that day task, visible
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    print(selectedDay);
                    print(focusedDay);
                  // TODO: go to today tasks details
                  },
                  daysOfWeekHeight: 50,
                  calendarFormat: CalendarFormat.week,
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now(),
                ),
              )
            ],
          ),
        ),
      );
}
