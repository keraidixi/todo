import 'package:flutter_bloc/flutter_bloc.dart';
import '../task_state.dart';

mixin FilterTask on Cubit<TaskState> {
  void filterCategory(String category) {
    emit(
      state.copyWith(selectedCategory: category),
    );
  }
}