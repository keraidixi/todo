abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskInProgress extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {}

class AddTaskFailure extends AddTaskState {
  final String message;

  AddTaskFailure(this.message);
}