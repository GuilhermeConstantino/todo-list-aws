import 'package:amplify_flutter/amplify_flutter.dart';

import '../../../../models/ModelProvider.dart' as aws;
import '../../domain/entities/todo.dart';
import '../models/todo_model.dart';

class AwsTodo {
  // TODO: implement failure class in core to catch errors

  Future<List<Todo>> getAllTodos() async {
    List<Todo> todos = [];
    List<aws.Todo> awsTodos = [];
    try {
      awsTodos = await Amplify.DataStore.query(aws.Todo.classType);
    } catch (e) {
      print("Could not query DataStore: $e");
    }
    for (aws.Todo awsTodo in awsTodos) {
      todos.add(Todo(
        id: awsTodo.id,
        title: awsTodo.title ?? '',
        description: awsTodo.descrip ?? '',
      ));
    }
    return todos;
  }

  Future<void> addTodo(TodoModel todo) async {
    final item = aws.Todo(title: todo.title, descrip: todo.description);
    await Amplify.DataStore.save(item);
  }

  Future<void> editTodo(TodoModel newTodo) async {
    final updatedItem = aws.Todo(
        id: newTodo.id.toString(),
        title: newTodo.title,
        descrip: newTodo.description);
    await Amplify.DataStore.save(updatedItem);
  }

  Future<void> removeTodo(Todo todo) async {
    final toDeleteItem = aws.Todo(id: todo.id);
    await Amplify.DataStore.delete(toDeleteItem);
  }
}
