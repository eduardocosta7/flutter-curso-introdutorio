import 'dart:math' as math;

import 'package:curso_flutter_introducao/data/task_dao.dart';
import 'package:curso_flutter_introducao/screens/initial_screen.dart';
import 'package:flutter/material.dart';

import 'difficult.dart';

class Task extends StatefulWidget {
  final String name;
  final String photo;
  int difficulty;
  int level;
  int progress;

  final Function? callback;

  Task(this.name, this.photo, this.difficulty, this.level, this.progress, this.callback, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  Color color = Colors.blue;

  bool assetOrNetwork() {
    if (widget.photo.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: color,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: assetOrNetwork()
                              ? Image.asset(
                                  widget.photo,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.photo,
                                  fit: BoxFit.cover,
                                )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.name,
                            style: const TextStyle(fontSize: 24),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Difficulty(difficultyLevel: widget.difficulty)
                      ],
                    ),
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: ElevatedButton(
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (_) => deleteDialog(),
                              barrierDismissible: false,
                            ).then((onValue) {
                              if (onValue == true) {
                                widget.callback!();
                                // context.read<TaskBloc>().inputTask.add(DeleteTask(taskId));
                              }
                            });
                          },
                          onPressed: () {
                            setState(() {
                              widget.level++;
                              TaskDao().updateLevel(widget);
                              if (widget.level >= widget.progress) {
                                widget.progress = widget.progress * widget.difficulty;
                                color =
                                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
                              }
                            });
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'Up',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: (widget.progress > 0)
                            ? (widget.level / widget.progress)
                            : 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Nivel ${widget.level}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  AlertDialog deleteDialog() {
    return AlertDialog(
      title: const Text('Deleter item'),
      content: Text('Tem certeza que deseja deletar ${widget.name}?'),
      actions: [
        TextButton(
          child: const Text('Sim'),
          onPressed: () async {
            await TaskDao().delete(widget.name);
            setState(() {
              Navigator.pop(context, true);
            });
          },
        ),
        TextButton(
          child: const Text('Não'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        )
      ],
      elevation: 24,
    );
  }
}
