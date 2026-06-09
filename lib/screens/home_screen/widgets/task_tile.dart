import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/task_cubit.dart';
import 'package:todo/model/task_model.dart';
import '../../../bloc/task/delete_task.dart';
import 'edit_task_dialog.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: (_) {
            context.read<TaskCubit>().deleteTask(task);
          },
        ),

        title: Text(task.title),
        subtitle: Text(task.category),

        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            showEditTaskDialog(context, task);
          },
        ),
      ),
    );
  }
}