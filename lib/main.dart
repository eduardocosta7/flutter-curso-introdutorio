import 'package:curso_flutter_introducao/data/task_inherited.dart';
import 'package:curso_flutter_introducao/screens/initial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
        // useMaterial3: true,
      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}
