// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoListController on TodoListControllerBase, Store {
  Computed<List<TodoModel>>? _$todoModelsComputed;

  @override
  List<TodoModel> get todoModels => (_$todoModelsComputed ??=
          Computed<List<TodoModel>>(() => super.todoModels,
              name: 'TodoListControllerBase.todoModels'))
      .value;

  late final _$todosAtom =
      Atom(name: 'TodoListControllerBase.todos', context: context);

  @override
  ObservableList<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$TodoListControllerBaseActionController =
      ActionController(name: 'TodoListControllerBase', context: context);

  @override
  void addTodo(Todo todo) {
    final _$actionInfo = _$TodoListControllerBaseActionController.startAction(
        name: 'TodoListControllerBase.addTodo');
    try {
      return super.addTodo(todo);
    } finally {
      _$TodoListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(Todo todo) {
    final _$actionInfo = _$TodoListControllerBaseActionController.startAction(
        name: 'TodoListControllerBase.removeTodo');
    try {
      return super.removeTodo(todo);
    } finally {
      _$TodoListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTodo(Todo todo) {
    final _$actionInfo = _$TodoListControllerBaseActionController.startAction(
        name: 'TodoListControllerBase.updateTodo');
    try {
      return super.updateTodo(todo);
    } finally {
      _$TodoListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
todoModels: ${todoModels}
    ''';
  }
}
