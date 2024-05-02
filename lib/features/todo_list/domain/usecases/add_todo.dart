import '../../data/repositories/todo_repository_impl.dart';
import '../entities/todo.dart';

class AddTodo {
  final TodoRepositoryImpl todoRepositoryImpl;

  AddTodo(this.todoRepositoryImpl);
  Future<bool> call(Todo todo) async {
    return todoRepositoryImpl.addTodo(todo);
  }
}
