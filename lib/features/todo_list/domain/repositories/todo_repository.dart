import '../entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getAllTodos();
  Future<bool> addTodo(Todo todo);
  Future<bool> removeTodo(int id);
  Future<bool> editTodo(Todo todo);
}
