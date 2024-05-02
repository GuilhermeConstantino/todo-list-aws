import '../../data/repositories/todo_repository_impl.dart';

class RemoveTodo {
  final TodoRepositoryImpl todoListRepository;

  RemoveTodo(this.todoListRepository);
  Future<bool> call(int id) async {
    return todoListRepository.removeTodo(id);
  }
}
