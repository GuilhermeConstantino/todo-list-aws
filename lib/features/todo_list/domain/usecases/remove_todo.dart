import '../../data/repositories/todo_repository_impl.dart';
import '../entities/todo.dart';

class RemoveTodo {
  final TodoRepositoryImpl todoListRepository;

  RemoveTodo(this.todoListRepository);
  Future<bool> call(Todo todo) async {
    return todoListRepository.removeTodo(todo);
  }
}
