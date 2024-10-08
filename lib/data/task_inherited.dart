// import 'package:curso_flutter_introducao/components/task.dart';
// import 'package:flutter/material.dart';
//
// class TaskInherited extends InheritedWidget {
//   double totalLevel = 0;
//
//   TaskInherited({
//     super.key,
//     required Widget child,
//   }) : super(child: child);
//
//   final List<Task> taskList = [
//     Task('Aprender Flutter', 'assets/images/dash.png', 4, 0, 1),
//     Task('Treinar', 'assets/images/meditando.jpeg', 2, 0, 1),
//     Task('Trabalhar', 'assets/images/player.jpg', 3, 0, 1),
//     Task('Investir', '', 5, 0, 1),
//     Task('Investir muito mesmo vamos estourar o texto', '', 1, 0, 1)
//   ];
//
//   void newTask(String name, String photo, int difficulty, int level, int progress) {
//     taskList.add(Task(name, photo, difficulty, level, progress));
//   }
//
//   static TaskInherited of(BuildContext context) {
//     final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
//     assert(result != null, 'No  found in context');
//     return result!;
//   }
//
//   @override
//   bool updateShouldNotify(TaskInherited oldWidget) {
//     return oldWidget.taskList.length != taskList.length;
//   }
//
//   double upTotalLevel () {
//     double total = 0;
//     for (var element in taskList) {
//       total += (element.level * element.difficulty / 1000) * taskList.length;
//       totalLevel = total;
//     }
//     return totalLevel;
//   }
// }
