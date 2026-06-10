import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/task_fetch/task_fetch_cubit.dart';
import 'package:todo/cubit/task_filter/task_filter_cubit.dart';
import 'package:todo/repository/task_repository.dart';

import 'cubit/delete_task/delete_task_cubit.dart';
import 'cubit/edit_task/edit_task_cubit.dart';
import 'screens/home_screen/home_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'model/task_model.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox<Task>('tasks');

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TaskFilterCubit()),
          BlocProvider(
            create: (_) => TaskFetchCubit(TaskRepository()),
          ),
          BlocProvider(
            create: (_) => DeleteTaskCubit(TaskRepository()),
          ),
          BlocProvider(create: (_)=> EditTaskCubit(TaskRepository()))
        ],
        child: const MyApp(),
      )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}