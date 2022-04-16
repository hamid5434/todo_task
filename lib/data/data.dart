import 'package:hive_flutter/hive_flutter.dart';

part 'data.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  int id = 0;

  @HiveField(1)
  String name = '';

  @HiveField(2)
  bool isCompleted = false;

  @HiveField(3)
  Priority priority = Priority.low;
}

@HiveType(typeId: 1)
enum Priority {
  @HiveField(0)
  low,
  @HiveField(2)
  normal,
  @HiveField(1)
  high,
}
