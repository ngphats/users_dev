import 'package:flutter/material.dart';
// import './user_edit_form.dart';

// void main() => runApp(const MyApp());
void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/demo.jpg'),
          ),
        ),
      ),
    ));
