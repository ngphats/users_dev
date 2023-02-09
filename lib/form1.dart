import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form Survey"),
        ),
        body: SurveyForm(),
      ),
    );
  }
}

class SurveyForm extends StatefulWidget {
  @override
  _SurveyFormState createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  int _age;
  String _gender;
  String _city;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(labelText: "Name"),
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
            onSaved: (value) => _name = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Age"),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your age";
              }
              return null;
            },
            onSaved: (value) => _age = int.parse(value),
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(labelText: "Gender"),
            value: _gender,
            items: [
              DropdownMenuItem(
                child: Text("Male"),
                value: "Male",
              ),
              DropdownMenuItem(
                child: Text("Female"),
                value: "Female",
              ),
            ],
            onChanged: (value) => setState(() => _gender = value),
            validator: (value) {
              if (value == null) {
                return "Please select your gender";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "City"),
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your city";
              }
              return null;
            },
            onSaved: (value) => _city = value,
          ),
          RaisedButton(onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("Name: $_name\nAge: $_age\nGender:"),
                    );
                  },),
            }
          })
        ]));
  }
}
