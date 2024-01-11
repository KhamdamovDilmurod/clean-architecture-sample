import 'package:equatable/equatable.dart';

import '../../data/models/todo_model.dart';

class Todo extends Equatable{
  int? id;
  String name;
  String description;
  String time;
  String location;
  int priority;


  Todo({required this.id, required this.name, required this.description, required this.time, required this.location, required this.priority});

  // Convert Todo to TodoModel
  TodoModel toTodoModel() {
    return TodoModel(
      id: id,
      name: name,
      description: description,
      time: time,
      location: location,
      priority: priority,
    );
  }


  @override
  List<Object?> get props => [id, name, description, time, location, priority];
}