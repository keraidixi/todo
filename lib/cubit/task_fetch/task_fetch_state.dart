import 'package:todo/model/task_model.dart';

abstract class TaskFetchState {
}

class TaskFetchInitial extends TaskFetchState {}

class TaskFetchLoading extends TaskFetchState {}

class TaskFetchSuccess extends TaskFetchState {
  final List<Task> tasks;

  TaskFetchSuccess(this.tasks);
}

class TaskFetchFailure extends TaskFetchState {
  final String message;

  TaskFetchFailure(this.message);
}