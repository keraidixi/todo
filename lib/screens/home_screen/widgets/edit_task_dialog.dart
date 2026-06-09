import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/task_cubit.dart';
import 'package:todo/model/task_model.dart';

import '../../../bloc/task/edit_task.dart';

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
            onPressed: () {
              context.read<TaskCubit>().editTask(
                task,
                controller.text,
              );
              Navigator.pop(context);
            },
            child: const Text("Edit"),
          ),
        ],
      );
    },
  );
}