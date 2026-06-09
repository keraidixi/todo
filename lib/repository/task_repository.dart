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

  void deleteTask(Task task) {
    final key = box.keyAt(box.values.toList().indexOf(task));
    box.delete(key);
  }

  void editTask(Task oldTask, Task newTask) {
    final key = box.keyAt(box.values.toList().indexOf(oldTask));
    box.put(key, newTask);
  }
}