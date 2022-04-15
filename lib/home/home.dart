import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_task/data.dart';
import 'package:todo_task/home/edit_task_screen.dart';
import 'package:todo_task/home/widgets/empty_state.dart';
import 'package:todo_task/home/widgets/task_item.dart';
import 'package:todo_task/main.dart';

import '../common/theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();
  final ValueNotifier<String> searchKeyWordNotifier = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Task>(taskBoxName);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditTaskScreen(
                task: Task(),
              ),
            ),
          );
        },
        label: Row(
          children: const [
            Text('Add New Task'),
            SizedBox(
              width: 8,
            ),
            Icon(Icons.add),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 102,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primaryVariant,
              ])),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'To Do List',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                        Icon(
                          CupertinoIcons.share,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 38,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: Theme.of(context).colorScheme.onPrimary,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.1),
                            blurRadius: 20,
                          )
                        ]),
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {
                        searchKeyWordNotifier.value = value;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search),
                        label: Text('Search Tasks...'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<String>(
                valueListenable: searchKeyWordNotifier,
                builder: (context, value, child) {
                  return ValueListenableBuilder<Box<Task>>(
                    builder: (context, box, child) {
                      final items;
                      if (controller.text.isEmpty) {
                        items = box.values.toList();
                        print('#########${items.length}#########');
                      } else {
                        items = box.values
                            .where(
                              (element) => element.name.contains(controller.text),
                        )
                            .toList();
                        print('*************${items.length}#########');
                      }
                      if (items.isNotEmpty) {
                        return ListView.builder(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 12, bottom: 80),
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
                                          style:
                                          Theme.of(context).textTheme.headline6,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Container(
                                          width: 60,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            borderRadius:
                                            BorderRadius.circular(1.5),
                                          ),
                                        )
                                      ],
                                    ),
                                    MaterialButton(
                                      color: const Color(0xffeaeff5),
                                      textColor: secondaryTextColor,
                                      elevation: 0,
                                      onPressed: () {
                                        box.clear();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                //print('**********${task.name}***********');
                                return TaskItem(
                                  taskEntity: task,
                                );
                              }
                            });
                      } else {
                        return EmptyState();
                      }
                    },
                    valueListenable: box.listenable(),
                  );
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}
