import '../model/task_model.dart';

class TaskState {
  final List<Task> tasks;
  final String? message;
  final String selectedCategory;

  TaskState({
    required this.tasks,
    this.message,
    this.selectedCategory = "All",
  });

  TaskState copyWith({
    List<Task>? tasks,
    String? message,
    String? selectedCategory,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      message: message,
      selectedCategory:
      selectedCategory ?? this.selectedCategory,
    );
  }
}