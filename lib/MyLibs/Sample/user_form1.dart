import 'package:flutter/material.dart';
import './product.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const myTitle = 'User Screen';
    return MaterialApp(
      title: myTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(myTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Quantity',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              dynamic newProduct = Product(50, quantity: 1);
              dynamic totalPrice = newProduct.showTotal();

              print(totalPrice);
            },
            child: const Text('Submit'),
          ),
        )
      ],
    );
  }
}
