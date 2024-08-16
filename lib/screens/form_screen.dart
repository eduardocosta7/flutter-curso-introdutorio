import 'package:curso_flutter_introducao/components/task.dart';
import 'package:curso_flutter_introducao/data/task_dao.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController photoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nova Tarefa"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira um nome para a tarefa!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "Nome",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (difficultyValidador(value)) {
                          return 'Insira um valor entre 1 e 5.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "Dificuldade",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Insira um url de imagem!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {
                          photoController.text = text;
                        });
                      },
                      controller: photoController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "Imagem",
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        photoController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/images/nophoto.png');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TaskDao().save(Task(
                            nameController.text,
                            photoController.text,
                            int.parse(difficultyController.text)));
                        // TaskInherited.of(widget.taskContext).newTask(
                        //     nameController.text,
                        //     photoController.text,
                        //     int.parse(difficultyController.text));
                        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                          const SnackBar(
                            content: Text('Criando uma nova tarefa'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Adicionar!'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool difficultyValidador(String? value) {
    if (value != null && value.isNotEmpty) {
      if (int.parse(value) >= 1 && int.parse(value) <= 5) {
        return false;
      }
      return true;
    }
    return true;
  }

  bool valueValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return false;
    }
    return true;
  }
}
