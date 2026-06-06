import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/task_model.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState(tasks: []));

  void addTask(
      String title,
      String category,
      ) {
    if (title.trim().isEmpty) return;

    final updatedTasks = List<Task>.from(state.tasks);

    updatedTasks.add(
      Task(
        title: title,
        category: category,
      ),
    );

    emit(
      state.copyWith(
        tasks: updatedTasks,
        message: "Task Added Successfully",
      ),
    );
  }

  void filterCategory(String category) {
    emit(
      state.copyWith(
        selectedCategory: category,
      ),
    );
  }

  void deleteTask(int index) {
    final updatedTasks = List<Task>.from(state.tasks);

    updatedTasks.removeAt(index);

    emit(
      state.copyWith(
        tasks: updatedTasks,
        message: "Task Deleted",
      ),
    );
  }

  void toggleTask(int index) {
    final updatedTasks = List<Task>.from(state.tasks);

    updatedTasks.removeAt(index);

    emit(
      state.copyWith(
        tasks: updatedTasks,
        message: "Task Completed & Removed",
      ),
    );
  }

  void editTask(int index, String title) {
    final updatedTasks = List<Task>.from(state.tasks);

    updatedTasks[index] = updatedTasks[index].copyWith(
      title: title,
    );

    emit(
      state.copyWith(
        tasks: updatedTasks,
        message: "Task Edited",
      ),
    );
  }
}