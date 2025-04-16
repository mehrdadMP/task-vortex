import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_vortex/HiveDB/task_data.dart';

const taskBoxName = 'tasks';

class EditTaskScreen extends StatelessWidget {
  EditTaskScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Task')),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(label: Text('Add a task for today...')),
            controller: _controller,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final task = Task(
            name: _controller.text,
            isCompleted: false,
            priority: Priority.low,
          );
          if (task.isInBox) {
            task.save(); // Save(update) the task in the Hive box.
          } else {
            final Box<Task> box = Hive.box<Task>(taskBoxName);
            box.add(task); // Add the task to the Hive box.
          }

          Navigator.of(
            context,
          ).pop(); // Close the screen after saving the task.
        },
        label: Text('Save Changes'),
      ),
    );
  }
}
