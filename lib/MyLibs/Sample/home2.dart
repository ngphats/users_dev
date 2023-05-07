import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeBody(),
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

  _incrementCounter() {
    print('OK $_counter');

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('I Am Rich'),
      ),
      body: SizedBox(
        height: 100.0,
        width: 300.0,
        child: Center(
          child: Text('Hello..$_counter'),
        ),
      ),

      // Center(
      //   child: Container(
      //     height: 400,
      //     width: 500,
      //     color: Colors.blueGrey[600],
      //     child: Text('here.. $_counter'),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
