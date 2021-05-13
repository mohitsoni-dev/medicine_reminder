import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PatientAddForm extends StatefulWidget {
  @override
  _PatientAddFormState createState() => _PatientAddFormState();
}

class _PatientAddFormState extends State<PatientAddForm> {
  @override
  void initState() {
    super.initState();
  }
  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final  _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient's Data"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilder(
                key: _fbKey,
                initialValue: {
                  'date': DateTime.now(),
                  'accept_terms': false,
                },
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'name',
                      style: Theme.of(context).textTheme.body1,
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
                      decoration: InputDecoration(labelText: "Full Name"),
                    ),

                    // FormBuilderDropdown(
                    //   name: "gender",
                    //   style: Theme.of(context).textTheme.body1,
                    //   decoration: InputDecoration(labelText: "Gender"),
                    //   // initialValue: 'Male',
                    //   hint: Text('Select Gender'),
                    //   validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
                    //   items: ['Male', 'Female', 'Other']
                    //       .map((gender) => DropdownMenuItem(
                    //       value: gender, child: Text("$gender")))
                    //       .toList(),
                    // ),
                    FormBuilderTextField(
                      name: "age",
                      style: Theme.of(context).textTheme.body1,
                      decoration: InputDecoration(labelText: "Age"),
                      keyboardType: TextInputType.number,
                      validator:FormBuilderValidators.compose( [
                        FormBuilderValidators.numeric(context),
                        FormBuilderValidators.max(context,70),
                      ]),
                    ),
                    FormBuilderTextField(
                      name: 'condition',
                      style: Theme.of(context).textTheme.body1,
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
                      decoration: InputDecoration(labelText: "Condition"),
                    ),
                    FormBuilderTextField(
                      name: 'doctor',
                      style: Theme.of(context).textTheme.body1,
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
                      decoration: InputDecoration(labelText: "Name of Doctor"),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    child: Text("Submit",style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                    onPressed: () {
                      _fbKey.currentState.save();
                      if (_fbKey.currentState.validate()) {
                        print(_fbKey.currentState.value);
                      }
                    },
                  ),
                  MaterialButton(
                    child: Text("Reset",style: TextStyle(color: Colors.white),),
                    color: Colors.deepOrange,
                    onPressed: () {
                      _fbKey.currentState.reset();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

