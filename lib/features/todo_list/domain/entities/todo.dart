class Todo {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.isCompleted});

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
