class DailyTasksListViewModel {
  final int id;
  final bool isDone;
  final String taskTitle;

  DailyTasksListViewModel({
    required this.id,
    required this.isDone,
    required this.taskTitle,
  });

  DailyTasksListViewModel copyWith({
    int? id,
    bool? isDone,
    String? taskTitle,
  }) =>
      DailyTasksListViewModel(
        id: id ?? this.id,
        isDone: isDone ?? this.isDone,
        taskTitle: taskTitle ?? this.taskTitle,
      );

  factory DailyTasksListViewModel.fromJson(Map<String, dynamic> json) =>
      DailyTasksListViewModel(
        id: json['id'],
        isDone: json['isDone'],
        taskTitle: json['title'],
      );
}
