import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/add_task/add_task_cubit.dart';
import '../../cubit/add_task/add_task_state.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final controller = TextEditingController();

  String selectedCategory = "Work";

  final categories = ["Work", "Personal", "Study", "Shopping"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter Task",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField(
              value: selectedCategory,
              items: categories.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),

            const SizedBox(height: 40),

            BlocConsumer<AddTaskCubit, AddTaskState>(
              builder: (context, state) {
                return state is AddTaskInProgress ? CircularProgressIndicator() : OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(300, 50)
                  ),
                  onPressed: (){
                    context.read<AddTaskCubit>().addTask(controller.text, selectedCategory);
                  },
                  child: Text('Save'),
                );
              },
                
              listener: (context, state) {
                if(state is AddTaskSuccess){
                  Navigator.pop(context);
                  controller.clear();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task Added Successfully')));
                }
                else if(state is AddTaskFailure){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to Add Task')));
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}