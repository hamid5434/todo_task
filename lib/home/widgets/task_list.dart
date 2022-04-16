import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/common/theme.dart';
import 'package:todo_task/data/data.dart';
import 'package:todo_task/data/repo/repository.dart';
import 'package:todo_task/home/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.items}) : super(key: key);

  final List<Task> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 80),
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 60,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(1.5),
                      ),
                    )
                  ],
                ),
                MaterialButton(
                  color: const Color(0xffeaeff5),
                  textColor: secondaryTextColor,
                  elevation: 0,
                  onPressed: () {
                    //box.clear();
                    final taskRepository =
                        Provider.of<Repository<Task>>(context, listen: false);
                    taskRepository.deleteAll();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Delete All'),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        CupertinoIcons.delete_simple,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            final Task task = items[index - 1];
            return TaskItem(
              taskEntity: task,
            );
          }
        });
  }
}
