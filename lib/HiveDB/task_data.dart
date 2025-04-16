import 'package:hive_flutter/hive_flutter.dart';
part 'task_data.g.dart';

//Create a box in the hive database for the [task] data. By assigning a typeId
//to the box, you can differentiate between different boxes in the database.
@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0) //By assigning a HiveField to the Fields, you can differentiate
  // between different Fields in the box.
  String name;
  @HiveField(1) //By assigning a HiveField to the Fields, you can differentiate
  // between different Fields in the box.
  bool isCompleted;
  @HiveField(2) //By assigning a HiveField to the Fields, you can differentiate
  // between different Fields in the box.
  Priority priority;

  Task({required this.name, required this.isCompleted, required this.priority});
}

//Define typeId for the priority data type, as it is an enum type that is 
//unknown to Hive.
@HiveType(typeId: 1)
enum Priority {
  @HiveField(0)
  low,
  @HiveField(1)
  normal,
  @HiveField(2)
  high,
}
