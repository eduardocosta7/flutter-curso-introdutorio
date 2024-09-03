import '../../components/task.dart';

abstract class TaskState {
  final List<Task> tasks;

  TaskState({required this.tasks});
}

class TaskInitialState extends TaskState {
  TaskInitialState() : super(tasks: []);
}

class TaskLoadingState extends TaskState {
  TaskLoadingState() : super(tasks: []);
}

class TaskLoadedState extends TaskState {
  TaskLoadedState({required List<Task> tasks}) : super(tasks: tasks);
}

class TaskErrorState extends TaskState {
  final Exception exception;

  TaskErrorState({required this.exception}) : super(tasks: []);
}
