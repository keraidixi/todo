import 'package:flutter/material.dart';
import 'package:todo/model/task_model.dart';

import 'delete_task_dialog.dart';
import 'edit_task_dialog.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            showDeleteTaskDialog(context, task);
          },
        ),
        title: Text(task.title),
        subtitle: Text(task.category),
        trailing: IconButton(
          onPressed: () {
            showEditTaskDialog(context, task);
          },
          icon: const Icon(Icons.edit),
        ),
      )

    );
  }
}