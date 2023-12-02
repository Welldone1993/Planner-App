class DailyTasksListDto {
  final bool? isDone;
  final String taskTitle;

  DailyTasksListDto({
    this.isDone = false,
    required this.taskTitle,
  });

  Map<String, dynamic> toJson() => {
        'title': taskTitle,
        'isDone': isDone,
      };
}
