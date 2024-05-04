import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/loading_state.dart';
import '../../data/models/todo_model.dart';
import '../../domain/entities/todo.dart';
import '../widgets/todo_form.dart';
import 'todo_list_controller.dart';

class TodoListPage extends StatelessWidget {
  final TodoListController todoListController;

  const TodoListPage({super.key, required this.todoListController});

  @override
  Widget build(BuildContext context) {
    var newTodoForm = TodoForm(
      isNewTodo: true,
      todo: TodoModel(
        id: '',
        title: '',
        description: '',
      ),
      newTodoMethod: (Todo todo) {
        todoListController.addTodo(todo);
      },
      changeTodoMethod: (Todo todo) {
        todoListController.updateTodo(todo);
      },
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return newTodoForm;
              });
        },
        tooltip: 'Add TODO',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'My TODO List',
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Observer(builder: (context) {
              return ListView.builder(
                  itemCount: todoListController.todos.length,
                  itemBuilder: (context, index) {
                    Todo todo = todoListController.todos[index];
                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Dismissible(
                        key: Key(todo.id.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          todoListController.removeTodo(todo);
                        },
                        child: ListTile(
                            title: Text(
                              todo.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(left: 8),
                            minVerticalPadding: 0,
                            dense: true,
                            tileColor: Colors.grey[200],
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    var editTodoForm = TodoForm(
                                      isNewTodo: false,
                                      todo: todo,
                                      newTodoMethod: (Todo todo) {
                                        todoListController.addTodo(todo);
                                      },
                                      changeTodoMethod: (Todo todo) {
                                        todoListController.updateTodo(todo);
                                      },
                                    );
                                    return editTodoForm;
                                  });
                            }),
                      ),
                    );
                  });
            }),
          ),
          Observer(builder: (context) {
            return Visibility(
                visible:
                    todoListController.pageLoadingState == LoadingState.loading,
                child: Container(
                  color: Colors.white.withOpacity(0.7),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ));
          }),
        ],
      ),
    );
  }
}
