import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/todo.dart';
import '../models/todo_model.dart';

class LocalTodo {
  // TODO: implement failure class in core to catch errors
  static const String _keyPrefix = 'todo_';
  static const String _highestIdKey = 'highest_id';

  Future<int> getHighestId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_highestIdKey) ?? 0;
  }

  Future<void> setHighestId(int highestId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_highestIdKey, highestId);
  }

  Future<List<Todo>> getAllTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((key) => key.startsWith(_keyPrefix));
    final List<Todo> todos = [];
    for (final key in keys) {
      final jsonString = prefs.getString(key);
      if (jsonString != null) {
        final Map<String, dynamic> jsonData = jsonDecode(jsonString);
        todos.add(TodoModel.fromJson(jsonData));
      }
    }
    return todos;
  }

  Future<void> saveTodo(TodoModel todoModel) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = jsonEncode(todoModel.toJson());
    await prefs.setString(_keyPrefix + todoModel.id.toString(), jsonString);
  }

  Future<Todo?> getTodoById(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyPrefix + id);
    if (jsonString == null) {
      return null;
    }
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return TodoModel.fromJson(jsonData);
  }

  Future<void> addTodo(TodoModel todo) async {
    final highestId = await getHighestId();
    final newId = highestId + 1;
    todo = todo.copyWith(id: newId);
    await saveTodo(todo);
    await setHighestId(newId);
  }

  Future<void> editTodo(TodoModel newTodo) async {
    await saveTodo(newTodo);
  }

  Future<void> removeTodoById(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyPrefix + id.toString());
  }
}
