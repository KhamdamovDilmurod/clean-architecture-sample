import 'package:get_it/get_it.dart';
import 'package:udemy_todo_task/features/todo/data/data_sources/local/database_helper.dart';
import 'package:udemy_todo_task/features/todo/domain/repositories/todo_repository.dart';
import 'package:udemy_todo_task/features/todo/domain/usecases/get_todos.dart';
import 'package:udemy_todo_task/features/todo/domain/usecases/insert_todo.dart';
import 'package:udemy_todo_task/features/todo/presentations/blog/todo_bloc.dart';

import 'config/routes/app_routes.dart';
import 'features/todo/data/repositories/todo_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Todo
  // Bloc
  sl.registerFactory(
    () => TodoBloc(
      fetchAllTodos: sl(),
      insertTodo: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllTodos(sl()));
  sl.registerLazySingleton(() => InsertTodo(sl()));

  // Repository
  sl.registerLazySingleton<TodoRepository>(
        () => TodoRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  // Data sources
  //local data sources
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper.instance);

  // App Router
  sl.registerLazySingleton<AppRouter>(() => AppRouter());

}

