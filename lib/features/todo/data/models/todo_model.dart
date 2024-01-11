import 'package:udemy_todo_task/features/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required int? id,
    required String name,
    required String description,
    required String time,
    required String location,
    required int priority,
  }) : super(
    id: id,
    name: name,
    description: description,
    time: time,
    location: location,
    priority: priority,
  );

  factory TodoModel.fromMap(Map<String, Object?> map) {
    return TodoModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      description: map['description'] as String,
      time: map['time'] as String,
      location: map['location'] as String,
      priority: map['priority'] as int,
    );
  }


  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'id': id,
      'name': name,
      'description': description,
      'time': time,
      'location': location,
      'priority': priority,
    };
    return map;
  }

  // Convert TodoModel to Todo
  Todo toTodo() {
    return Todo(
      id: id,
      name: name,
      description: description,
      time: time,
      location: location,
      priority: priority,
    );
  }

}
