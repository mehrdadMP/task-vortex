import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_vortex/HiveDB/task_data.dart';
import 'package:task_vortex/home_screen.dart';

const taskBoxName = 'tasks';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // For async tasks.
  await Hive.initFlutter(); // Hive initialization.
  Hive.registerAdapter(TaskAdapter()); // Register the Task Model Adapter.
  Hive.registerAdapter(PriorityAdapter()); // Register the Priority Model Adapter.
  await Hive.openBox<Task>(taskBoxName); // Opening a Box(A box in Hive acts like a table in a relational database) for Tasks.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: HomeScreen()
    );
  }
}

