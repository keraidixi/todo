import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repository/task_repository.dart';
import 'package:todo/model/task_model.dart';

import 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState>{

  final TaskRepository repository;

  DeleteTaskCubit(this.repository) : super(DeleteTaskInitial());

  Future<void> deleteTask(Task task) async {
    emit(DeleteTaskInProgress());
    try {
      await repository.deleteTask(task);
      emit(DeleteTaskSuccess());
    } catch (e) {
      emit(DeleteTaskFailure(e.toString()));
    }
  }
}