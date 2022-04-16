import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/common/theme.dart';
import 'package:todo_task/data/data.dart';
import 'package:todo_task/data/repo/repository.dart';
import 'package:todo_task/home/edit_task_screen.dart';
import 'package:todo_task/home/widgets/my_check_box.dart';

class TaskItem extends StatefulWidget {
  TaskItem({Key? key, required this.taskEntity}) : super(key: key);
  final Task taskEntity;

  static const double height = 70;
  static const double radius = 8;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    final Color priorityColor;
    switch (widget.taskEntity.priority) {
      case Priority.high:
        priorityColor = highColor;
        break;
      case Priority.normal:
        priorityColor = normalColor;
        break;
      case Priority.low:
        priorityColor = lowColor;
        break;
    }
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditTaskScreen(task: widget.taskEntity),
          ),
        );
      },
      onLongPress: () {
        final repository =
            Provider.of<Repository<Task>>(context, listen: false);
        repository.delete(widget.taskEntity);
      },
      child: Container(
        height: TaskItem.height,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TaskItem.radius),
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 20,
              )
            ]),
        child: Row(
          children: [
            MyCheckBox(
              value: widget.taskEntity.isCompleted,
              onTab: () {
                setState(() {
                  widget.taskEntity.isCompleted =
                      !widget.taskEntity.isCompleted;
                });
              },
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                widget.taskEntity.name,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    decoration: widget.taskEntity.isCompleted
                        ? TextDecoration.lineThrough
                        : null),
              ),
            ),
            Container(
              width: 5,
              height: TaskItem.height,
              decoration: BoxDecoration(
                  color: priorityColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(TaskItem.radius),
                    bottomRight: Radius.circular(TaskItem.radius),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
