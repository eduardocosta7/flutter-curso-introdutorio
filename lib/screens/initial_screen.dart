import 'package:curso_flutter_introducao/data/task_inherited.dart';
import 'package:curso_flutter_introducao/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  late TaskInherited taskInherited = TaskInherited.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          // leading: Container(),
          flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 50.0,
                  ),
                  child: Text(
                    'Tarefas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: (taskInherited.totalLevel > 0)
                              ? (taskInherited.totalLevel / 100)
                              : 1,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        "Level: ${taskInherited.totalLevel.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      // const SizedBox(width: 10.0),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              taskInherited.upTotalLevel();
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline),
                          color: Colors.white),
                    ],
                  ),
                ),
              ]),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: taskInherited.taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
