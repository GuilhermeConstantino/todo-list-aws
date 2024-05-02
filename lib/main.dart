import 'package:flutter/material.dart';

import 'features/todo_list/presentation/pages/todo_list_controller.dart';
import 'features/todo_list/presentation/pages/todo_list_page.dart';

void main() {
  final TodoListController todoListController = TodoListController();
  todoListController.getData(); // Call getData here
  runApp(MyApp(todoListController: todoListController));
}

class MyApp extends StatelessWidget {
  final TodoListController todoListController;
  const MyApp({super.key, required this.todoListController});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoListPage(todoListController: todoListController),
    );
  }
}
