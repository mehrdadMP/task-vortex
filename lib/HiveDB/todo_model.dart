import 'package:hive/hive.dart';

part 'todo_model.g.dart'; // The file that build_runner creates

@HiveType(typeId: 0) // Each model must have a unique typeId.
class Todo {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}