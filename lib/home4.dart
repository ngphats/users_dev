import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Show-Images'),
        ),
        body: const HomePageWidget(),
      ),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _counter = 1;

  void _incrementCount() {
    setState(() {
      if (_counter >= 5) {
        _counter = 1;
      } else {
        _counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: TextButton(
          onPressed: _incrementCount,
          child: Image.asset('images/$_counter.jpg'),
        ),
      ),
    );
  }
}
