import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Users',
      theme: ThemeData(brightness: Brightness.dark),
      home: const FormPage(title: 'Flutter Users'),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  UserListState createState() => UserListState();
}

class UserListState extends State<UserList> {
  List lsUser = [];

  void loadUserList() {
    lsUser = [
      {
        'name': 'user1',
        'email': 'ngphats@gmail.com',
        'age': 20,
        'gender': 2,
        'married': 'Married',
        'password': '**********',
      },
      {
        'name': 'user2',
        'email': 'ngphats@gmail.com',
        'age': 20,
        'gender': 0,
        'married': 'Married',
        'password': '**********',
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    // get list users
    loadUserList();

    return getTable();
  }

  getTable() {
    return DataTable(
      columns: getTableColums(),
      rows: getTableList(),
    );
  }

  getTableColums() {
    List columns = <DataColumn>[
      const DataColumn(
        label: Expanded(
          child: Text(
            'Username',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      const DataColumn(
        label: Expanded(
          child: Text(
            'Email',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      const DataColumn(
        label: Expanded(
          child: Text(
            'Age',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      const DataColumn(
        label: Expanded(
          child: Text(
            'Gender',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      const DataColumn(
        label: Expanded(
          child: Text(
            'Married',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
    ];

    return columns;
  }

  getTableList() {
    List tableData = <DataRow>[];

    for (var element in lsUser) {
      int age = element['age'];

      String gender = '';
      switch (element['gender']) {
        case 0:
          gender = 'Male';
          break;
        case 1:
          gender = 'Female';
          break;
        case 2:
          gender = 'Others';
          break;
      }

      tableData.add(
        DataRow(
          cells: <DataCell>[
            DataCell(
              Text(element['name'] ?? ''),
            ),
            DataCell(
              Text(element['email'] ?? ''),
            ),
            DataCell(
              Text('$age'),
            ),
            DataCell(
              Text(gender),
            ),
            DataCell(
              Text(element['married'] ?? ''),
            ),
          ],
        ),
      );
    }

    return tableData;
  }
}
