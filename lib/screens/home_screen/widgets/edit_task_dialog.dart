import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/task_cubit.dart';

void showEditTaskDialog(BuildContext context, int index, String oldTitle) {
  final controller = TextEditingController(text: oldTitle);

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
                index,
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