import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/model/task_model.dart';

import '../../../cubit/edit_task/edit_task_state.dart';
import '../../../cubit/task_fetch/task_fetch_cubit.dart';
import '../../../cubit/edit_task/edit_task_cubit.dart';

void showEditTaskDialog(BuildContext context, Task task) {
  final controller = TextEditingController(text: task.title);

  showDialog(
    context: context,
    builder: (_) {
      return BlocConsumer<EditTaskCubit, EditTaskState>(
        listener: (context, state) {
          if (state is EditTaskSuccess) {
            context.read<TaskFetchCubit>().loadTasks();
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Task Updated Successfully')),
            );
          } else if (state is EditTaskFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return AlertDialog(
            title: const Text("Edit Task"),
            content: TextField(controller: controller),
            actions: [
              state is EditTaskInProgress ? const CircularProgressIndicator() :
              TextButton(
                onPressed: () async {
                   context.read<EditTaskCubit>().editTask(
                    task,
                    controller.text,
                  );
                },
                child: const Text('Edit'),
              ),
            ],
          );
        },
      );
    },
  );
}