import 'package:flutter/material.dart';

class ChallengeOne extends StatelessWidget {
  const ChallengeOne({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio 1',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
          useMaterial3: true),
      home: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.redAccent,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.orangeAccent,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.yellowAccent,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.lightGreenAccent,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.lightBlueAccent,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.blueAccent,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.purpleAccent,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.pinkAccent,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.white,
                  width: 100,
                  height: 100,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}