import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/task_cubit.dart';
import '../../bloc/task_state.dart';
import '../add_task/add_task.dart';
import 'widgets/task_counter.dart';
import 'widgets/task_list.dart';
import 'widgets/category_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        centerTitle: true,
      ),
      body: BlocListener<TaskCubit, TaskState>(
        listener: (context, state) {
          if (state.message != null) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message!)),
            );
          }
        },
        child: const Column(
          children: [
            TaskCounter(),

            CategoryFilter(),

            Expanded(
              child: TaskList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddTaskScreen(),
            ),
          );
        },
      ),
    );
  }
}