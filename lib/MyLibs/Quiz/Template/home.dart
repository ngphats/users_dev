import 'package:flutter/material.dart';
import 'quiz_body.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Quiz'),
        ),
        body: const QuizBodyWidget(),
      ),
    );
  }
}
