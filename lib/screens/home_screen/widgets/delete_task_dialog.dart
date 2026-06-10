import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/delete_task/delete_task_cubit.dart';
import '../../../cubit/delete_task/delete_task_state.dart';
import '../../../cubit/task_fetch/task_fetch_cubit.dart';
import '../../../model/task_model.dart';

void showDeleteTaskDialog(BuildContext context, Task task) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
        listener: (context, state) {
          if (state is DeleteTaskSuccess) {
            context.read<TaskFetchCubit>().loadTasks();
            Navigator.pop(dialogContext);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Task Deleted Successfully')),
            );
          } else if (state is DeleteTaskFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        builder: (context, state) {
          return AlertDialog(
            title: const Text('Delete Task'),
            content: Text('Are you sure you want to delete "${task.title}"?',style: TextStyle(fontSize: 18),),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              state is DeleteTaskInProgress
                  ? const CircularProgressIndicator()
                  : TextButton(
                      onPressed: () {
                        dialogContext.read<DeleteTaskCubit>().deleteTask(task);
                      },
                      child: const Text('Delete'),
                  ),
            ],
          );
        },
      );
    },
  );
}