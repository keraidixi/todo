import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/task_cubit.dart';

import '../task_state.dart';

mixin LoadTask on Cubit<TaskState> {
  Future<void> loadTasks() async {
    final cubit = this as TaskCubit;

    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 2));

    emit(
      state.copyWith(
        tasks: cubit.repository.getTasks(),
        isLoading: false,
      ),
    );
  }
}