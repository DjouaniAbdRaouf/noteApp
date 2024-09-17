class TodoTask {
  final String title;
  final String description;
  final DateTime deadline;

  TodoTask({
    required this.title,
    required this.description,
    required this.deadline,
  });

  factory TodoTask.fromJson(Map<String, dynamic> json) {
    return TodoTask(
      title: json['title'],
      description: json['description'],
      deadline: DateTime.parse(json['deadline']),
    );
  }
  // format for saving data in local storage using SP
  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'deadline': deadline.toIso8601String(),
      };
}
