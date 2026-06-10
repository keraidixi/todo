import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/task_fetch/task_fetch_cubit.dart';
import '../../../cubit/task_fetch/task_fetch_state.dart';

class TaskCounter extends StatelessWidget {
  const TaskCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFetchCubit, TaskFetchState>(
      builder: (context, state) {
        if (state is TaskFetchSuccess) {
          return Container(
            padding: const EdgeInsets.all(11),
            alignment: Alignment.centerLeft,
            child: Text(
              "Total Tasks : ${state.tasks.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}