import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_task/common/theme.dart';
import 'package:todo_task/data.dart';
import 'package:todo_task/home/widgets/priority_checkbox.dart';
import 'package:todo_task/main.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;

  EditTaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0,
        title: const Text('Edit Task'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final task = Task();
          task.name = _controller.text;
          task.priority = Priority.high;
          if (task.isInBox) {
            task.save();
          } else {
            final Box<Task> box = Hive.box<Task>(taskBoxName);
            box.add(task);
          }
          Navigator.of(context).pop();
        },
        label: Row(
          children: [
            const Text('Save Change'),
            const SizedBox(
              width: 8,
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
              child: const Icon(
                Icons.check,
                size: 20,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  child: PriorityCheckBox(
                    color: highColor,
                    isSelected: widget.task.priority == Priority.high,
                    label: 'High',
                    onTab: () {
                      setState(() {
                        widget.task.priority = Priority.high;
                      });
                    },
                  ),
                  flex: 1,
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: PriorityCheckBox(
                    color: normalColor,
                    isSelected: widget.task.priority == Priority.normal,
                    label: 'Normal',
                    onTab: () {
                      setState(() {
                        widget.task.priority = Priority.normal;
                      });
                    },
                  ),
                  flex: 1,
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: PriorityCheckBox(
                    color: lowColor,
                    isSelected: widget.task.priority == Priority.low,
                    label: 'Low',
                    onTab: () {
                      setState(() {
                        widget.task.priority = Priority.low;
                      });
                    },
                  ),
                  flex: 1,
                )
              ],
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                label: Text(
                  'Add Task For Today...',
                  style: Theme.of(context).textTheme.bodyText1!.apply(
                        fontSizeFactor: 1.2,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
