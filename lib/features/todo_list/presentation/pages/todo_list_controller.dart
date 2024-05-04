import 'package:mobx/mobx.dart';
import 'package:todo_list/features/todo_list/data/datasources/aws_todo.dart';

import '../../../../core/loading_state.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/add_todo.dart';
import '../../domain/usecases/edit_todo.dart';
import '../../domain/usecases/get_all_todos.dart';
import '../../domain/usecases/remove_todo.dart';

part 'todo_list_controller.g.dart';

class TodoListController = TodoListControllerBase with _$TodoListController;

abstract class TodoListControllerBase with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  LoadingState pageLoadingState = LoadingState.initial;

  TodoRepositoryImpl todoRepositoryImpl =
      TodoRepositoryImpl(awsTodo: AwsTodo());

  @action
  getData() async {
    pageLoadingState = LoadingState.loading;
    await Future.delayed(const Duration(seconds: 2));
    GetAllTodos getAllTodos = GetAllTodos(todoRepositoryImpl);
    todos = ObservableList.of(await getAllTodos.call());
    pageLoadingState = LoadingState.success;
  }

  @action
  addTodo(Todo todo) async {
    AddTodo addTodo = AddTodo(todoRepositoryImpl);
    bool result = await addTodo.call(todo);
    if (result == true) {
      todos.add(todo);
    }
  }

  @action
  removeTodo(Todo todo) async {
    RemoveTodo removeTodo = RemoveTodo(todoRepositoryImpl);
    bool result = await removeTodo.call(todo);
    if (result == true) {
      todos.remove(todo);
    }
  }

  @action
  updateTodo(Todo todo) async {
    EditTodo editTodo = EditTodo(todoRepositoryImpl);
    bool result = await editTodo.call(todo);
    if (result == true) {
      int todoIndex = todos.indexOf(todos.firstWhere((e) => e.id == todo.id));
      todos[todoIndex] = todo;
    }
  }
}
