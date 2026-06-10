import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/task_filter/task_filter_state.dart';
import '../../../cubit/task_filter/task_filter_cubit.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFilterCubit, TaskFilterState>(
      builder: (context, state) {
        final categories = ["All", "Work", "Personal", "Study", "Shopping"];

        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ChoiceChip(
                  label: Text(category),
                  selected: state.selectedCategory == category,
                  showCheckmark: false,
                  onSelected: (_) {
                    context.read<TaskFilterCubit>().filterCategory(category);              },
                ),
              );
            },
          ),
        );
      },
    );
  }
}