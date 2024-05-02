import '../../data/repositories/todo_repository_impl.dart';
import '../entities/todo.dart';

class EditTodo {
  final TodoRepositoryImpl todoRepositoryImpl;

  EditTodo(this.todoRepositoryImpl);
  Future<bool> call(Todo todo) async {
    return todoRepositoryImpl.editTodo(todo);
  }
}
