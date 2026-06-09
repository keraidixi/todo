import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/task_state.dart';
import 'package:todo/repository/task_repository.dart';

import 'task/add_task.dart';
import 'task/delete_task.dart';
import 'task/edit_task.dart';
import 'task/load_task.dart';
import 'task/filter_task.dart';

class TaskCubit extends Cubit<TaskState>
    with AddTask, DeleteTask, EditTask, LoadTask, FilterTask {

  final TaskRepository repository;

  TaskCubit(this.repository)
      : super(TaskState(tasks: []));
}