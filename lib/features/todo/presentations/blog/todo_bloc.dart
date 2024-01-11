import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:udemy_todo_task/core/usecases/usecase.dart';

import '../../domain/entities/todo.dart';
import '../../domain/usecases/get_todos.dart';
import '../../domain/usecases/insert_todo.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetAllTodos fetchAllTodos;
  final InsertTodo insertTodo;

  TodoBloc({
    required this.fetchAllTodos,
    required this.insertTodo,
  }) : super(TodoInitial()) {
    on<FetchAllTodoEvent>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await fetchAllTodos.call(NoParams());
        todos.fold(
          (failure) => emit(TodoError('Failed to fetch todos.')),
          (todos) => emit(FetchAllTodoState(todos)),
        );
      } catch (e) {
        emit(TodoError('Failed to fetch todos.'));
      }
    });
    on<InsertTodoEvent>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await insertTodo.call(event.todo);
        todos.fold(
          (failure) => emit(TodoError('Failed to fetch todos.')),
          (todo) => emit(TodoInsertState(todo)),
        );
      } catch (e) {
        emit(TodoError('Failed to fetch todos.'));
      }
    });
  }

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is FetchAllTodoEvent) {
      yield* _mapFetchAllTodoEventToState();
    } else if (event is InsertTodoEvent) {
      yield* _mapInsertTodoEventToState(event.todo);
    }
  }

  Stream<TodoState> _mapFetchAllTodoEventToState() async* {
    yield TodoLoading();
    final result = await fetchAllTodos.call(NoParams());
    yield result.fold(
      (failure) => TodoError(failure.toString()),
      (todos) => FetchAllTodoState(todos),
    );
  }

  Stream<TodoState> _mapInsertTodoEventToState(Todo todo) async* {
    yield TodoLoading();
    final result = await insertTodo(todo);
    yield result.fold(
      (failure) => TodoError(failure.toString()),
      (insertedTodo) => TodoInsertState(insertedTodo),
    );
  }
}
