import 'package:hive/hive.dart';

import '../model/task_model.dart';

class TaskRepository {

  final box = Hive.box<Task>('tasks');

  List<Task> getTasks() {
    return box.values.toList();
  }

  void addTask(Task task) {
    box.add(task);
  }

  void deleteTask(int index) {
    box.deleteAt(index);
  }

  void editTask(int index, Task task) {
    box.putAt(index, task);
  }
}