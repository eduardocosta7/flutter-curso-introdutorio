import 'package:flutter/material.dart';

import 'difficult.dart';
import 'dart:math' as math;

class Task extends StatefulWidget {
  final String name;
  final String photo;
  int difficulty;

  Task(this.name, this.photo, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  Color color = Colors.blue;

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
                          child: Image.asset(widget.photo, fit: BoxFit.cover)),
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
                          onPressed: () {
                            setState(() {
                              level++;
                             if (level >= widget.difficulty) {
                               widget.difficulty = widget.difficulty * 3;
                               color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
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
                        value: (widget.difficulty > 0)
                            ? (level / widget.difficulty)
                            : 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Nivel $level',
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
}
