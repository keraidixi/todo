import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/model/task_model.dart';

import '../../../cubit/task_fetch/task_fetch_cubit.dart';
import '../../../cubit/edit_task/edit_task_cubit.dart';

void showEditTaskDialog(BuildContext context, Task task) {
  final controller = TextEditingController(text: task.title);

  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text("Edit Task"),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await context.read<EditTaskCubit>().editTask(task,controller.text);
              context.read<TaskFetchCubit>().loadTasks();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Task Updated Successfully')),);
            },
            child: const Text('Edit'),
          ),
        ],
      );
    },
  );
}