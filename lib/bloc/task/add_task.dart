import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/task_cubit.dart';
import 'package:todo/model/task_model.dart';
import 'package:uuid/uuid.dart';

import '../task_state.dart';

mixin AddTask on Cubit<TaskState> {
  void addTask(String title, String category) {
    final task = Task(
      id: const Uuid().v4(),
      title: title,
      category: category,
    );

    (this as TaskCubit).repository.addTask(task);

    emit(
      state.copyWith(
        tasks: (this as TaskCubit).repository.getTasks(),
        message: "Task Added",
      ),
    );
  }
}