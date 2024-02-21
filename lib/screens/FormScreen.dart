import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Tarefa"),
      ),
      body: Center(
        child: Container(
          height: 650,
          width: 375,
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 3)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: TextEditingController(),
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                  fillColor: Colors.white70, filled: true, hintText: "Nome"),
            ),
          ),
        ),
      ),
    );
  }
}
