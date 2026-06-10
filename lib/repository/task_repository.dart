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

  Future<void> deleteTask(Task task) async{
    final key = box.keyAt(box.values.toList().indexOf(task));
    await box.delete(key);
  }

  Future<void> editTask(Task oldTask, Task newTask) async {
    final key = box.keyAt(box.values.toList().indexOf(oldTask));
    await box.put(key, newTask);
  }
}