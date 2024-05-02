// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoListController on TodoListControllerBase, Store {
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

  late final _$pageLoadingStateAtom =
      Atom(name: 'TodoListControllerBase.pageLoadingState', context: context);

  @override
  LoadingState get pageLoadingState {
    _$pageLoadingStateAtom.reportRead();
    return super.pageLoadingState;
  }

  @override
  set pageLoadingState(LoadingState value) {
    _$pageLoadingStateAtom.reportWrite(value, super.pageLoadingState, () {
      super.pageLoadingState = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('TodoListControllerBase.getData', context: context);

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$addTodoAsyncAction =
      AsyncAction('TodoListControllerBase.addTodo', context: context);

  @override
  Future addTodo(Todo todo) {
    return _$addTodoAsyncAction.run(() => super.addTodo(todo));
  }

  late final _$removeTodoAsyncAction =
      AsyncAction('TodoListControllerBase.removeTodo', context: context);

  @override
  Future removeTodo(Todo todo) {
    return _$removeTodoAsyncAction.run(() => super.removeTodo(todo));
  }

  late final _$updateTodoAsyncAction =
      AsyncAction('TodoListControllerBase.updateTodo', context: context);

  @override
  Future updateTodo(Todo todo) {
    return _$updateTodoAsyncAction.run(() => super.updateTodo(todo));
  }

  @override
  String toString() {
    return '''
todos: ${todos},
pageLoadingState: ${pageLoadingState}
    ''';
  }
}
