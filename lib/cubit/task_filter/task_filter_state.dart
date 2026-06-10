class TaskFilterState {
  final String selectedCategory;

  const TaskFilterState({this.selectedCategory = "All"});

  TaskFilterState copyWith({String? selectedCategory}) {
    return TaskFilterState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}