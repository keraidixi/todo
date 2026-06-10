import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/model/task_model.dart';

import '../../../cubit/delete_task/delete_task_cubit.dart';
import '../../../cubit/delete_task/delete_task_state.dart';
import '../../../cubit/task_fetch/task_fetch_cubit.dart';
import 'edit_task_dialog.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccess) {
          context.read<TaskFetchCubit>().loadTasks();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Task Deleted Successfully'),
            ),
          );
        }

        if (state is DeleteTaskFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: ListTile(
            leading: Checkbox(
              value: task.isDone,
              onChanged: state is DeleteTaskInProgress ? null : (value) {
                context.read<DeleteTaskCubit>().deleteTask(task);
              }
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
      },
    );
  }
}