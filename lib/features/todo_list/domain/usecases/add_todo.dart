import 'package:todo_list/features/todo_list/domain/entities/todo.dart';

import '../../data/repositories/todo_repository_impl.dart';

class AddTodo {
  final TodoRepositoryImpl todoRepository;

  AddTodo(this.todoRepository);
  Future<bool> call(Todo todo) async {
    return todoRepository.addTodo(todo);
  }
}
