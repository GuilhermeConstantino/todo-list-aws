import '../../domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required super.id,
    required super.title,
    required super.description,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  factory TodoModel.fromTodo(Todo todo) {
    return TodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  @override
  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
