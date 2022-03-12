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
      appBar: AppBar(
        title: const Text('To Do List'),
        centerTitle: true,
      ),
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
          children: [
            Text('Add New Task'),
            Icon(Icons.add),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 102,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                ]
              )
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Box<Task>>(
              builder: (context,box,child){
                return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      final Task task = box.values.toList()[index];
                      //print('**********${task.name}***********');
                      return Container(
                        child: Text(task.name),
                      );
                    });
              }, valueListenable: box.listenable(),
            ),
          ),
        ],
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
          if(task.isInBox){
            task.save();
          }
         else {
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
