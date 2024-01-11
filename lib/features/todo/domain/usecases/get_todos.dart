import 'package:dartz/dartz.dart';
import 'package:udemy_todo_task/core/error/failures.dart';
import 'package:udemy_todo_task/core/usecases/usecase.dart';
import 'package:udemy_todo_task/features/todo/domain/repositories/todo_repository.dart';

import '../entities/todo.dart';

class GetAllTodos implements UseCase<List<Todo>, NoParams>{
  final TodoRepository repository;

  GetAllTodos(this.repository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams noParams) async {
   return await repository.fetchAllTodos();
  }
  
}