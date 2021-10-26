class Todo {
  Todo({
    required this.id,
    required this.completed,
    required this.title,
  });

  final int id;
  final bool completed;
  final String title;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
