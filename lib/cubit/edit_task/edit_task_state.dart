abstract class EditTaskState {}

class EditTaskInitial extends EditTaskState {}

class EditTaskInProgress extends EditTaskState {}

class EditTaskSuccess extends EditTaskState {}

class EditTaskFailure extends EditTaskState {
  final String message;

  EditTaskFailure(this.message);
}