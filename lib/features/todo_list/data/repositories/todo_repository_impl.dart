import '../datasources/local_todo.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';

import '../models/todo_model.dart';

class TodoRepositoryImpl extends TodoRepository {
  final LocalTodo localTodo;

  TodoRepositoryImpl({required this.localTodo});

  @override
  Future<bool> addTodo(Todo todo) async {
    TodoModel todoModel = TodoModel.fromTodo(todo);
    localTodo.addTodo(todoModel);
    return true;
  }

  @override
  Future<bool> editTodo(Todo todo) async {
    TodoModel todoModel = TodoModel.fromTodo(todo);
    localTodo.editTodo(todoModel);
    return true;
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    return await localTodo.getAllTodos();
  }

  @override
  Future<bool> removeTodo(int id) async {
    localTodo.removeTodoById(id);
    return true;
  }
}
