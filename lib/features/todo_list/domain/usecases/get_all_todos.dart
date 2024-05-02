import 'package:todo_list/features/todo_list/domain/entities/todo.dart';

import '../../data/repositories/todo_repository_impl.dart';

class GetAllTodos {
  final TodoRepositoryImpl todoRepository;

  GetAllTodos(this.todoRepository);
  Future<List<Todo>> call() async {
    return todoRepository.getAllTodos();
  }
}
