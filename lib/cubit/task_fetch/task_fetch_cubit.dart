import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repository/task_repository.dart';
import 'task_fetch_state.dart';

class TaskFetchCubit extends Cubit<TaskFetchState> {
  final TaskRepository repository;

  TaskFetchCubit(this.repository) : super(TaskFetchInitial());

  Future<void> loadTasks() async {
    emit(TaskFetchLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));
      final tasks = repository.getTasks();
      emit(TaskFetchSuccess(tasks));
    } catch (e) {
      emit(TaskFetchFailure(e.toString()));
    }
  }
}