import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter User',
      theme: ThemeData(brightness: Brightness.dark),
      home: const FormPage(title: 'Flutter User'),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SignUpForm()),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  String _name = '';
  String _email = '';
  int _age = -1;
  String _maritalStatus = 'single';
  int _selectedGender = 0;

  List<DropdownMenuItem<int>> genderList = [];

  void loadGenderList() {
    genderList = [];
    genderList.add(const DropdownMenuItem(
      value: 0,
      child: Text('Male'),
    ));
    genderList.add(const DropdownMenuItem(
      value: 1,
      child: Text('Female'),
    ));
    genderList.add(const DropdownMenuItem(
      value: 2,
      child: Text('Others'),
    ));
  }

  void loadUserInfo() {
    Map userInfo = {
      'name': 'user2',
      'email': 'ngphats@gmail.com',
      'age': 20,
      'gender': 0,
      'married': 'married'
    };

    _name = userInfo['name'];
    _email = userInfo['email'];
    _age = int.parse(userInfo['age']);
    _selectedGender = userInfo['gender'];
    _maritalStatus = userInfo['married'];
  }

  @override
  Widget build(BuildContext context) {
    loadGenderList();

    loadUserInfo();

    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: ListView(
        children: getFormWidget(),
      ),
    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = [];

    formWidget.add(TextFormField(
      initialValue: _name,
      decoration: const InputDecoration(
        labelText: 'Enter Name',
        hintText: 'Name',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a name';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _name = value.toString();
        });
      },
    ));

    validateEmail(String? value) {
      if (value!.isEmpty) {
        return 'Please enter mail';
      }

      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern.toString());
      if (!regex.hasMatch(value.toString())) {
        return 'Enter Valid Email';
      } else {
        return null;
      }
    }

    formWidget.add(TextFormField(
      initialValue: _email,
      decoration: const InputDecoration(
        labelText: 'Enter Email',
        hintText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        setState(() {
          _email = value.toString();
        });
      },
    ));

    formWidget.add(TextFormField(
      initialValue: _age,
      decoration: const InputDecoration(
        hintText: 'Age',
        labelText: 'Enter Age',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter age';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _age = int.parse(value.toString());
        });
      },
    ));

    formWidget.add(DropdownButton(
      hint: const Text('Select Gender'),
      items: genderList,
      value: _selectedGender,
      onChanged: (value) {
        setState(() {
          _selectedGender = int.parse(value.toString());
        });
      },
      isExpanded: true,
    ));

    formWidget.add(Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('Single'),
          value: 'single',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Married'),
          value: 'married',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
      ],
    ));

    void onPressedSubmit() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
/*
        print("Name " + _name);
        print("Email " + _email);
        print("Age " + _age.toString());
        switch (_selectedGender) {
          case 0:
            print("Gender Male");
            break;
          case 1:
            print("Gender Female");
            break;
          case 3:
            print("Gender Others");
            break;
        }
        print("Marital Status " + _maritalStatus);
        print("Password " + _password);
        print("Termschecked " + _termsChecked.toString());
*/
        Map currentUser = {
          'name': _name,
          'email': _email,
          'age': _age,
          'gender': _selectedGender,
          'married': _maritalStatus,
        };

        print(currentUser);

        // save to firebase here!

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Form Submitted'),
          ),
        );
      }
    }

    formWidget.add(
      ElevatedButton(
        onPressed: onPressedSubmit,
        child: const Text('Edit'),
      ),
    );

    return formWidget;
  }
}
