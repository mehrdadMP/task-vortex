import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_vortex/HiveDB/task_data.dart';
import 'package:task_vortex/features/auth/presentation/edit_task_screen.dart';

const taskBoxName = 'tasks';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Task>(taskBoxName); //Initialize a task box
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => EditTaskScreen()));
        },
        label: Text('Add New Task'),
      ),
      appBar: AppBar(title: Text('To Do List')),
      body: ValueListenableBuilder<Box<Task>>(
        valueListenable: box.listenable(),
        builder: (BuildContext context, box, Widget? child) {
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              final task = box.values.toList()[index];
              return Container(child: Text(task.name));
            },
          );
        },
      ),
    );
  }
}
