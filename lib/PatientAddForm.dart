import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PatientAddForm extends StatefulWidget {
  @override
  _PatientAddFormState createState() => _PatientAddFormState();
}

class _PatientAddFormState extends State<PatientAddForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Patient'),
      ),
      body: Container(),
    );
  }
}
