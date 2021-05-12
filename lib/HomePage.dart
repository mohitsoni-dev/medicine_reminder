import 'package:flutter/material.dart';
import 'package:meds_reminder/DrawerClass.dart';
import 'package:meds_reminder/PatientAddForm.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meds Reminder'),
      ),
      body: Container(),
      drawer: DrawerClass(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PatientAddForm()));
        },
        tooltip: 'Add a patient',
        child: Icon(Icons.add),
      ),
    );
  }
}
