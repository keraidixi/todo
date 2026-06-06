import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/task_cubit.dart';
import '../../../bloc/task_state.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {

        final filteredTasks =
        state.selectedCategory == "All"
            ? state.tasks
            : state.tasks.where((task) {
          return task.category ==
              state.selectedCategory;
        }).toList();

        if (filteredTasks.isEmpty) {
          return const Center(
            child: Text(
              "No Tasks Available",
            ),
          );
        }

        return ListView.builder(
          itemCount: filteredTasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              task: filteredTasks[index],
              index: state.tasks.indexOf(
                filteredTasks[index],
              ),
            );
          },
        );
      },
    );
  }
}