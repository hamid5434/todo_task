import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/data/data.dart';
import 'package:todo_task/data/repo/repository.dart';
import 'package:todo_task/home/bloc/task_list_bloc.dart';
import 'package:todo_task/home/edit_task_screen.dart';
import 'package:todo_task/home/widgets/empty_state.dart';
import 'package:todo_task/home/widgets/task_item.dart';
import 'package:todo_task/home/widgets/task_list.dart';
import 'package:todo_task/main.dart';

import '../common/theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final box = Hive.box<Task>(taskBoxName);
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
          children: [
            const Text('Add New Task'),
            const SizedBox(
              width: 8,
            ),
            Container(
              child: const Icon(
                Icons.add,
                size: 20,
              ),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider<TaskListBloc>(
        create: (context) => TaskListBloc(
          context.read<Repository<Task>>(),
        ),
        child: SafeArea(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'To Do List',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
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
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.1),
                              blurRadius: 20,
                            )
                          ]),
                      child: TextField(
                        controller: controller,
                        onChanged: (value) {
                          context
                              .read<TaskListBloc>()
                              .add(TaskListSearch(value));
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
              Expanded(child: Consumer<Repository<Task>>(
                builder: (context, value, child) {
                  context.read<TaskListBloc>().add(TaskListStarted());
                  return BlocBuilder<TaskListBloc, TaskListState>(
                    builder: (context, state) {
                      if (state is TaskListSuccess) {
                        return TaskList(items: state.items);
                      } else if (state is TaskListEmpty) {
                        return const EmptyState();
                      } else if (state is TaskListLoading ||
                          state is TaskListInitial) {
                        return const CircularProgressIndicator();
                      } else if (state is TaskListError) {
                        return Center(
                          child: Text(state.errorMessage),
                        );
                      } else {
                        throw Exception('error state');
                      }
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
