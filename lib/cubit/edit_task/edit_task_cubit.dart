import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/repository/task_repository.dart';

import 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  final TaskRepository repository;

  EditTaskCubit(this.repository) : super(EditTaskInitial());

  Future<void> editTask(Task task, String newTitle) async {
    emit(EditTaskInProgress());

    try {
      final updatedTask = task.copyWith(
        title: newTitle,
      );

      await repository.editTask(task, updatedTask);

      emit(EditTaskSuccess());
    } catch (e) {
      emit(EditTaskFailure(e.toString()));
    }
  }
}