import '../datasources/aws_todo.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';

import '../models/todo_model.dart';

class TodoRepositoryImpl extends TodoRepository {
  final AwsTodo awsTodo;

  TodoRepositoryImpl({required this.awsTodo});

  @override
  Future<bool> addTodo(Todo todo) async {
    TodoModel todoModel = TodoModel.fromTodo(todo);

    awsTodo.addTodo(todoModel);
    return true;
  }

  @override
  Future<bool> editTodo(Todo todo) async {
    TodoModel todoModel = TodoModel.fromTodo(todo);
    awsTodo.editTodo(todoModel);
    return true;
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    return await awsTodo.getAllTodos();
  }

  @override
  Future<bool> removeTodo(Todo todo) async {
    awsTodo.removeTodo(todo);
    return true;
  }
}
