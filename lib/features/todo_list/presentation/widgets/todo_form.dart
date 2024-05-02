import 'package:flutter/material.dart';

import '../../domain/entities/todo.dart';

class TodoForm extends StatelessWidget {
  final Todo todo;
  final bool isNewTodo;
  final Function(Todo) newTodoMethod;
  final Function(Todo) changeTodoMethod;

  const TodoForm(
      {super.key,
      required this.todo,
      required this.newTodoMethod,
      required this.changeTodoMethod,
      required this.isNewTodo});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: todo.title);
    TextEditingController descriptionController =
        TextEditingController(text: todo.description);

    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Todo changedTodo = todo.copyWith(
                  title: titleController.text,
                  description: descriptionController.text);
              isNewTodo
                  ? newTodoMethod(changedTodo)
                  : changeTodoMethod(changedTodo);
              Navigator.of(context).pop();
            },
            child: const Align(
                alignment: Alignment.bottomRight, child: Text('ok'))),
      ],
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Title:'),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              controller: titleController,
            ),
          ),
          const Text('Description:'),
          TextField(
            maxLines: 5,
            controller: descriptionController,
          ),
        ],
      ),
    );
  }
}
