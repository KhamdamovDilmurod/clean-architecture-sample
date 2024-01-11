import 'dart:js_interop';

import 'package:dartz/dartz.dart';
import 'package:udemy_todo_task/core/error/failures.dart';
import 'package:udemy_todo_task/features/todo/domain/entities/todo.dart';
import 'package:udemy_todo_task/features/todo/domain/repositories/todo_repository.dart';

import '../data_sources/local/database_helper.dart';

class TodoRepositoryImpl implements TodoRepository {
  final DatabaseHelper localDataSource;

  TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<Todo>>> fetchAllTodos() async {
    try {
      final todos = await localDataSource.getAllTodos();
      print("tick1");
      final todosList = todos.map((todoModel) => todoModel.toTodo()).toList();
      print("tick2");
      return Right(todosList);
    } catch (e) {
      return Left(DatabaseFailure()); // Assuming DatabaseFailure is a Failure subtype for database-related errors
    }
  }

  @override
  Future<Either<Failure, Todo>> insertTodo(Todo todo) async {
    try {
      final insertedTodo = await localDataSource.insert(todo.toTodoModel());
      return Right(insertedTodo.toTodo());
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int?>> updateTodo(Todo todo) async {
    try {
      final updatedTodo = await localDataSource.update(todo.toTodoModel());
      return Right(updatedTodo);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int?>> removeTodo(int id) async {
    try {
      final removedId = await localDataSource.delete(id);
      return Right(removedId);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}