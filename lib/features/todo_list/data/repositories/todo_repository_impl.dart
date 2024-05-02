import 'package:todo_list/features/todo_list/data/datasources/todo_local.dart';
import 'package:todo_list/features/todo_list/domain/entities/todo.dart';
import 'package:todo_list/features/todo_list/domain/repositories/todo_repository.dart';

import '../models/todo_model.dart';

class TodoRepositoryImpl extends TodoRepository {
  final TodoLocal todoLocal;

  TodoRepositoryImpl({required this.todoLocal});

  @override
  Future<bool> addTodo(Todo todo) async {
    TodoModel todoModel = TodoModel.fromTodo(todo);
    todoLocal.addTodo(todoModel);
    return true;
  }

  @override
  Future<bool> editTodo(Todo todo) async {
    TodoModel todoModel = TodoModel.fromTodo(todo);
    todoLocal.editTodo(todoModel);
    return true;
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    return await todoLocal.getAllTodos();
  }

  @override
  Future<bool> removeTodo(int id) async {
    todoLocal.removeTodoById(id);
    return true;
  }
}
