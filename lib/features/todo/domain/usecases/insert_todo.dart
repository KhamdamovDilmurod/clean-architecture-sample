import 'package:dartz/dartz.dart';
import 'package:udemy_todo_task/core/error/failures.dart';
import 'package:udemy_todo_task/core/usecases/usecase.dart';
import 'package:udemy_todo_task/features/todo/domain/repositories/todo_repository.dart';

import '../entities/todo.dart';

class InsertTodo implements UseCase<Todo, Todo> {
  final TodoRepository repository;

  InsertTodo(this.repository);

  @override
  Future<Either<Failure, Todo>> call(Todo todo) async {
    return await repository.insertTodo(todo);
  }
}