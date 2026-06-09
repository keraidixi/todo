import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/task_cubit.dart';
import 'package:todo/model/task_model.dart';

import '../task_state.dart';

mixin DeleteTask on Cubit<TaskState> {
  void deleteTask(Task task) {
    final cubit = this as TaskCubit;

    cubit.repository.deleteTask(task);

    emit(
      state.copyWith(
        tasks: cubit.repository.getTasks(),
        message: "Task Deleted",
      ),
    );
  }
}