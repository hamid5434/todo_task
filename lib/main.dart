import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_task/data.dart';
import 'package:todo_task/home.dart';

import 'common/theme.dart';

const taskBoxName = 'tasks';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(PriorityAdapter());
  await Hive.openBox<Task>(taskBoxName);
  runApp(const MyApp());
}

const Color primeryColor = Color(0xff794cff);
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff1d2830);
    final secondaryTextColor = Color(0xffafbed0);
    return MaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: primeryColor,
          primaryVariant:const Color(0xff5c0aff),
          background: const Color(0xfff3f5f8),
          onSurface: primaryTextColor,
          onBackground: primaryTextColor,
          secondary: primeryColor,
          onSecondary: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
