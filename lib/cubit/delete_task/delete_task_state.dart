abstract class DeleteTaskState {}

class DeleteTaskInitial extends DeleteTaskState {}

class DeleteTaskInProgress extends DeleteTaskState {}

class DeleteTaskSuccess extends DeleteTaskState {}

class DeleteTaskFailure extends DeleteTaskState {
  final String message;
  DeleteTaskFailure(this.message);
}