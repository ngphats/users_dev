import 'package:flutter/material.dart';
import './product.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  late var _name;
  late var _age;
  var _gender = 'Male';
  late var _city;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
            onSaved: (value) => _name = value,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Age"),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your age";
              }
              return null;
            },
            onSaved: (value) => _age = value,
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(labelText: "Gender"),
            value: _gender,
            items: ['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) => setState(() => _gender = value!),
            validator: (value) {
              if (value == null) {
                return "Please select your gender";
              }
              return null;
            },
          ),
          /*
          DropdownButton<String>(
            value: _gender,
            onChanged: (value) => setState(() => _gender = value!),
            items: ['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          */
          TextFormField(
            decoration: const InputDecoration(labelText: "City"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your city";
              }
              return null;
            },
            onSaved: (value) => _city = value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  print("Name is $_name");
                  print("Age is $_age");
                  print("Gender is $_gender");
                  print("City is $_city");
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
