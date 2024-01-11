import 'package:dartz/dartz.dart';
import 'package:udemy_todo_task/core/error/failures.dart';
import 'package:udemy_todo_task/features/todo/domain/entities/todo.dart';

abstract class TodoRepository{
  Future<Either<Failure, List<Todo>>> fetchAllTodos();
  Future<Either<Failure, Todo>> insertTodo(Todo todo);
  Future<Either<Failure, int?>> updateTodo(Todo todo);
  Future<Either<Failure, int?>> removeTodo(int id);
}