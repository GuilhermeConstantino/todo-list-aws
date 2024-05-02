import '../../data/repositories/todo_repository_impl.dart';
import '../entities/todo.dart';

class GetAllTodos {
  final TodoRepositoryImpl todoRepositoryImpl;

  GetAllTodos(this.todoRepositoryImpl);
  Future<List<Todo>> call() async {
    return todoRepositoryImpl.getAllTodos();
  }
}
