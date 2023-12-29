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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(color: Colors.redAccent, width: 200, height: 200,),
          Container(color: Colors.blueAccent, width: 100, height: 100,)
        ],
      ),
    );
  }
}
