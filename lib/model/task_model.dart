import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task {

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String category;

  Task({
    required this.title,
    required this.category,
  });

  Task copyWith({
    String? title,
    String? category,
  }) {
    return Task(
      title: title ?? this.title,
      category: category ?? this.category,
    );
  }
}