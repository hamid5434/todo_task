import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_task/data/data.dart';
import 'package:todo_task/data/repo/repository.dart';

part 'task_list_event.dart';

part 'task_list_state.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  final Repository<Task> repository;

  TaskListBloc(this.repository) : super(TaskListInitial()) {
    on<TaskListEvent>(
      (event, emit) async {
        if (event is TaskListSearch || event is TaskListStarted) {
          String searchTerm = '';
          emit(TaskListLoading());
          if (event is TaskListSearch) {
            searchTerm = event.searchKeyWord;
          }
          try {
            final items = await repository.getAll(searchKeyWord: searchTerm);
            if (items.isNotEmpty) {
              emit(TaskListSuccess(items));
            } else {
              emit(TaskListEmpty());
            }
          } catch (ex) {
            emit(TaskListError(ex.toString()));
          }
        } else if (event is TaskListDeleteAll) {
          await repository.deleteAll();
          emit(TaskListEmpty());
        } else if (event is TaskListDelete) {
          await repository.delete(event.task);
          //emit(TaskListSuccess());
        }
      },
    );
  }
}
