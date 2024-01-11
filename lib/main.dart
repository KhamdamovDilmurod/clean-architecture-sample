import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_todo_task/features/todo/presentations/blog/todo_bloc.dart';

import 'config/routes/app_routes.dart';
import 'config/theme/theme.dart';
import 'features/todo/domain/usecases/get_todos.dart';
import 'features/todo/domain/usecases/insert_todo.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(
          create: (BuildContext context) => TodoBloc(
            fetchAllTodos: di.sl<GetAllTodos>(),
            insertTodo: di.sl<InsertTodo>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        onGenerateRoute: di.sl<AppRouter>().onGenerateRoute,
      ),
    );
  }
}
