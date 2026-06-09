import 'package:todo/bloc/task_cubit.dart';
import 'package:todo/model/task_model.dart';
import '../task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin EditTask on Cubit<TaskState> {
  void editTask(Task task, String newTitle) {
    final cubit = this as TaskCubit;

    final updated = task.copyWith(title: newTitle);

    cubit.repository.editTask(task, updated);

    emit(
      state.copyWith(
        tasks: cubit.repository.getTasks(),
        message: "Task Updated",
      ),
    );
  }
}