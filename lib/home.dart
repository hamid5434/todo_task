import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_task/data.dart';
import 'package:todo_task/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Task>(taskBoxName);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditTaskScreen(),
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
                  SizedBox(
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
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Icon(
                          CupertinoIcons.share,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 38,
                    margin: EdgeInsets.symmetric(horizontal: 16),
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search),
                        label: Text('Search Tasks...'),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<Box<Task>>(
                builder: (context, box, child) {
                  return ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        final Task task = box.values.toList()[index];
                        //print('**********${task.name}***********');
                        return Container(
                          child: Text(task.name),
                        );
                      });
                },
                valueListenable: box.listenable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditTaskScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final task = Task();
          task.name = _controller.text;
          task.priority = Priority.low;
          if (task.isInBox) {
            task.save();
          } else {
            final Box<Task> box = Hive.box<Task>(taskBoxName);
            box.add(task);
          }
          Navigator.of(context).pop();
        },
        label: Text('Save Change'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(label: Text('Add Task Or Today...')),
          ),
        ],
      ),
    );
  }
}
