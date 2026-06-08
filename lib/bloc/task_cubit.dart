import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/task_state.dart';

import '../model/task_model.dart';
import '../repository/task_repository.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository repository;

  TaskCubit(this.repository)
      : super(
    TaskState(
      tasks: [],
    ),
  );

  Future<void> loadTasks() async {

    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    await Future.delayed(
      const Duration(seconds: 2),
    );

    final tasks = repository.getTasks();

    emit(
      state.copyWith(
        tasks: tasks,
        isLoading: false,
      ),
    );
  }

  void addTask(
      String title,
      String category,
      ) {
    repository.addTask(
      Task(
        title: title,
        category: category,
      ),
    );

    emit(
      state.copyWith(
        tasks: repository.getTasks(),
        message: "Task Added Successfully",
      ),
    );
  }

  void deleteTask(int index) {
    repository.deleteTask(index);

    emit(
      state.copyWith(
        tasks: repository.getTasks(),
        message: "Task Deleted",
      ),
    );
  }

  void editTask(
      int index,
      String title,
      ) {
    repository.editTask(
      index,
      repository.getTasks()[index].copyWith(
        title: title,
      ),
    );

    emit(
      state.copyWith(
        tasks: repository.getTasks(),
        message: "Task Updated",
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

}