import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/data/repo/repository.dart';
import 'package:todo_task/data/source/hive_task_source.dart';
import 'package:todo_task/home/home.dart';

import 'common/theme.dart';
import 'data/data.dart';

const taskBoxName = 'tasks';

void main() async {
  //final Repository<Task> repository = Repository(HiveTaskDataSource(Hive.box(taskBoxName)));

  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(PriorityAdapter());
  await Hive.openBox<Task>(taskBoxName);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: primaryVariant),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => Repository<Task>(
        HiveTaskDataSource(
          Hive.box(taskBoxName),
        ),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: HomeScreen(),
    );
  }
}
