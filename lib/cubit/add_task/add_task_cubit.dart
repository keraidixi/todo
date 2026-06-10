import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../model/task_model.dart';
import '../../../repository/task_repository.dart';
import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final TaskRepository repository;

  AddTaskCubit(this.repository) : super(AddTaskInitial());

  Future<void> addTask(String title, String category) async {
    emit(AddTaskInProgress());
    await Future.delayed(const Duration(seconds: 2));
      try {
      final task = Task(
        id: const Uuid().v4(),
        title: title,
        category: category,
      );

      repository.addTask(task);

      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskFailure(e.toString()));
    }
  }
}
