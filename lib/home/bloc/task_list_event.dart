part of 'task_list_bloc.dart';

abstract class TaskListEvent extends Equatable {
  const TaskListEvent();
}

class TaskListStarted extends TaskListEvent {
  @override
  List<Object?> get props => [];
}

class TaskListSearch extends TaskListEvent {
  final String searchKeyWord;

  const TaskListSearch(this.searchKeyWord);

  @override
  List<Object?> get props => [searchKeyWord];
}

class TaskListDeleteAll extends TaskListEvent {
  @override
  List<Object?> get props => [];
}


class TaskListDelete extends TaskListEvent {
  final Task task;

  const TaskListDelete(this.task);
  @override
  List<Object?> get props => [task];
}
