part of 'task_list_bloc.dart';

abstract class TaskListState extends Equatable {
  const TaskListState();
}

class TaskListInitial extends TaskListState {
  @override
  List<Object> get props => [];
}

class TaskListLoading extends TaskListState {
  @override
  List<Object> get props => [];
}

class TaskListSuccess extends TaskListState {
  final List<Task> items;

  const TaskListSuccess(this.items);

  @override
  List<Object> get props => [items];
}

class TaskListEmpty extends TaskListState {
  @override
  List<Object> get props => [];
}

class TaskListError extends TaskListState {
  final String errorMessage;

  const TaskListError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
