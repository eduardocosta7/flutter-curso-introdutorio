import 'package:curso_flutter_introducao/components/task.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool isOpacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: AnimatedOpacity(
        opacity: isOpacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter',
                'assets/images/dash.png',
                4),
            Task(
                'Treinar',
                'assets/images/meditando.jpeg',
                2),
            Task('Trabalhar',
                'assets/images/player.jpg', 3),
            Task('Investir', '', 5),
            Task('Investir muito mesmo vamos estourar o texto', '', 1)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isOpacidade = !isOpacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
