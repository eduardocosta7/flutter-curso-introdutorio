import 'dart:async';

import 'package:curso_flutter_introducao/data/bloc/task_event.dart';
import 'package:curso_flutter_introducao/data/bloc/task_state.dart';
import 'package:curso_flutter_introducao/data/task_dao.dart';

import '../../components/task.dart';

class TaskBloc {
  final _repository = TaskDao();

  final StreamController<TaskEvent> _inputTaskController =
      StreamController<TaskEvent>();
  final StreamController<TaskState> _outputTaskController =
      StreamController<TaskState>();

  Sink<TaskEvent> get inputTask => _inputTaskController.sink;

  Stream<TaskState> get outputTask => _outputTaskController.stream;

  TaskBloc() {
    _inputTaskController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TaskEvent event) async {
    List<Task> tasks = [];

    _outputTaskController.add(TaskLoadingState());

    if (event is GetTask) {
      tasks = await _repository.findAll();
    } else if (event is PostTask) {
      tasks = await _repository.save(event.task);
    } else if (event is DeleteTask) {
      tasks = await _repository.delete(event.task.name);
    }

    _outputTaskController.add(TaskLoadedState(tasks: tasks));
  }
}
