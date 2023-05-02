import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomeBody(),
    );
  }
}

class MyHomeBody extends StatefulWidget {
  const MyHomeBody({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomeBody();
  }
}

class _MyHomeBody extends State {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('I Am Rich'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          Container(
            height: 100,
            color: Colors.blueGrey[700],
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text('Hello world! $_counter'),
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.blueGrey[400],
            child: Center(
              child: Text('$_counter'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
