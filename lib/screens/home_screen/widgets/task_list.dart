import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/task_fetch/task_fetch_cubit.dart';
import '../../../cubit/task_fetch/task_fetch_state.dart';

import '../../../cubit/task_filter/task_filter_cubit.dart';
import '../../../cubit/task_filter/task_filter_state.dart';

import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFetchCubit, TaskFetchState>(
      builder: (context, fetchState) {
        return BlocBuilder<TaskFilterCubit, TaskFilterState>(
          builder: (context, filterState) {

            if (fetchState is TaskFetchLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (fetchState is TaskFetchSuccess) {
              final tasks = fetchState.tasks;

              final filteredTasks =
              filterState.selectedCategory == "All"
                  ? tasks
                  : tasks
                  .where((t) => t.category == filterState.selectedCategory)
                  .toList();

              if (filteredTasks.isEmpty) {
                return const Center(child: Text("No Tasks Available"));
              }

              return ListView.builder(
                itemCount: filteredTasks.length,
                itemBuilder: (context, index) {
                  return TaskTile(task: filteredTasks[index]);
                },
              );
            }

            return const SizedBox();
          },
        );
      },
    );
  }
}