import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/task_cubit.dart';
import '../../../model/task_model.dart';
import 'edit_task_dialog.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final int index;

  const TaskTile({
    super.key,
    required this.task,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: ListTile(
        leading: Checkbox(
          value: false,
          onChanged: (_) {
            context.read<TaskCubit>().toggleTask(index);
          },
        ),
        title: Text(
          task.title,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Pending"),
            Text(
              task.category,
            ),
          ],
        ),

        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            showEditTaskDialog(
              context,
              index,
              task.title,
            );
          },
        ),
      ),
    );
  }
}