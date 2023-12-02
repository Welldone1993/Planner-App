class DailyTasksListDto {
  final bool? isDone;
  final String taskTitle;

  DailyTasksListDto({
    this.isDone = false,
    required this.taskTitle,
  });
}
