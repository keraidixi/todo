import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_filter_state.dart';

class TaskFilterCubit extends Cubit<TaskFilterState> {
  TaskFilterCubit() : super(const TaskFilterState());

  void filterCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }
}