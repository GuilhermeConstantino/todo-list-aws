import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';

import 'features/todo_list/presentation/pages/todo_list_controller.dart';
import 'features/todo_list/presentation/pages/todo_list_page.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_api/amplify_api.dart';

import 'models/ModelProvider.dart';
import 'amplifyconfiguration.dart';

bool isAmplifyConfigured = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  final TodoListController todoListController = TodoListController();
  todoListController.getData();
  runApp(MyApp(todoListController: todoListController));
}

// Future<void> configureAmplify() async {
//   await Amplify.addPlugin(AmplifyAPI());
//   await Amplify.addPlugins(
//       [AmplifyDataStore(modelProvider: ModelProvider.instance)]);
//   await Amplify.configure(amplifyconfig);
//   isAmplifyConfigured = true;
// }

Future<void> _configureAmplify() async {
  try {
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    final dataStorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    // final auth = AmplifyAuthCognito();
    await Amplify.addPlugins([api, dataStorePlugin]);
    await Amplify.configure(amplifyconfig);

    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
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
