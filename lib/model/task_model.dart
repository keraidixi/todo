class Task {
  final String title;
  final bool isCompleted;
  final String category;

  Task({
    required this.title,
    required this.category,
    this.isCompleted = false,
  });

  Task copyWith({
    String? title,
    bool? isCompleted,
    String? category,
  }) {
    return Task(
      title: title ?? this.title,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}