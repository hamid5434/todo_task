import 'package:flutter/material.dart';
import 'package:todo_task/data.dart';
import 'package:todo_task/home/widgets/my_check_box.dart';

class TaskItem extends StatefulWidget {
  TaskItem({Key? key, required this.taskEntity}) : super(key: key);
  final Task taskEntity;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 20,
            )
          ]),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                widget.taskEntity.isCompleted = !widget.taskEntity.isCompleted;
              });
            },
            child: MyCheckBox(
              value: widget.taskEntity.isCompleted,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              widget.taskEntity.name,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                decoration: widget.taskEntity.isCompleted ? TextDecoration.lineThrough : null
              ),
            ),
          ),
        ],
      ),
    );
  }
}
