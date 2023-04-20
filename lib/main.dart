import 'package:flutter/material.dart';
// import './user_edit_form.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: const Text("I'm Rich"),
        ),
        body: const Processing(),
      ),
    );
  }
}

class Processing extends StatefulWidget {
  const Processing({super.key});

  @override
  State<StatefulWidget> createState() {
    return BodyHome();
  }
}

class BodyHome extends State {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You have pressed the button $_count times.'),
    );
  }
}

void main() => runApp(const MyApp());
