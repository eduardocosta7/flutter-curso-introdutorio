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
        home: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    color: Colors.redAccent,
                    width: 200,
                    height: 200,
                  ),
                  Container(
                    color: Colors.blueAccent,
                    width: 100,
                    height: 100,
                  )
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    color: Colors.blueAccent,
                    width: 200,
                    height: 200,
                  ),
                  Container(
                    color: Colors.redAccent,
                    width: 100,
                    height: 100,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.cyanAccent,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.pinkAccent,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.purpleAccent,
                    height: 50,
                    width: 50,
                  )
                ],
              ),
              Container(
                color: Colors.amberAccent,
                height: 30,
                width: 300,
                child: const Text(
                  'Diamante Amarelo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print('Você apertou o botão');
                  },
                  child: const Text('Aperte o botão!'),)
            ],
          ),
        ));
  }
}
