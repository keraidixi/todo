import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/task_fetch/task_fetch_cubit.dart';

import '../../cubit/add_task/add_task_cubit.dart';
import '../../cubit/task_fetch/task_fetch_state.dart';
import '../../repository/task_repository.dart';
import '../add_task/add_task_screen.dart';
import 'widgets/category_filter.dart';
import 'widgets/task_counter.dart';
import 'widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<TaskFetchCubit>().loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo App"), centerTitle: true),
      body: BlocListener<TaskFetchCubit, TaskFetchState>(
        listener: (context, state) {
          if (state is TaskFetchFailure) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<TaskFetchCubit>().loadTasks();
          },
          child: const SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                TaskCounter(),
                CategoryFilter(),
                SizedBox(height: 15),
                SizedBox(
                  height: 600,
                  child: TaskList(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => AddTaskCubit(TaskRepository()),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}