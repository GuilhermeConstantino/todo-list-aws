import 'package:mobx/mobx.dart';
import 'package:todo_list/features/todo_list/domain/entities/todo.dart';
import 'package:todo_list/features/todo_list/data/models/todo_model.dart';

part 'todo_list_controller.g.dart';

class TodoListController = TodoListControllerBase with _$TodoListController;

abstract class TodoListControllerBase with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @action
  void addTodo(Todo todo) {
    todos.add(todo);
  }

  @action
  void removeTodo(Todo todo) {
    todos.remove(todo);
  }

  @action
  void updateTodo(Todo todo) {
    final index = todos.indexWhere((t) => t.title == todo.title);
    if (index != -1) {
      todos[index] = todo;
    }
  }

  @computed
  List<TodoModel> get todoModels {
    return todos
        .map((todo) => TodoModel(
              id: todo.id,
              title: todo.title,
              description: todo.description,
              isCompleted: todo.isCompleted,
            ))
        .toList();
  }
}
