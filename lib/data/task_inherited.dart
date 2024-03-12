import 'package:curso_flutter_introducao/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  const TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  static List<Task> lista = [
    Task('Aprender Flutter', 'assets/images/dash.png', 4),
    Task('Treinar', 'assets/images/meditando.jpeg', 2),
    Task('Trabalhar', 'assets/images/player.jpg', 3),
    Task('Investir', '', 5),
    Task('Investir muito mesmo vamos estourar o texto', '', 1)
  ];

  void NewTask(String name, String photo, int difficulty) {
    lista.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final ? result = context.dependOnInheritedWidgetOfExactType<>();
    assert(result != null, 'No  found in context');
    return
    result
    !;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return;
  }
}
