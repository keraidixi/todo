import '../model/task_model.dart';

class TaskState {
  final List<Task> tasks;
  final bool isLoading;
  final String? message;
  final String selectedCategory;

  TaskState({
    required this.tasks,
    this.isLoading = false,
    this.message,
    this.selectedCategory = "All",
  });

  TaskState copyWith({
    List<Task>? tasks,
    bool? isLoading,
    String? message,
    String? selectedCategory,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      message: message,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}