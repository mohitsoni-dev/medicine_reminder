import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:meds_reminder/database/database.dart';
import 'package:meds_reminder/database/models/Patient.dart';

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
  final _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient's Data"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
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
                    style: Theme.of(context).textTheme.bodyText2,
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    decoration: InputDecoration(labelText: "Full Name"),
                  ),
                  SizedBox(height: 8.0),
                  FormBuilderTextField(
                    name: "age",
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: InputDecoration(labelText: "Age"),
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.numeric(context),
                      FormBuilderValidators.max(context, 110),
                    ]),
                  ),
                  SizedBox(height: 8.0),
                  FormBuilderTextField(
                    name: 'condition',
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: InputDecoration(labelText: "Condition"),
                  ),
                  SizedBox(height: 8.0),
                  FormBuilderTextField(
                    name: 'doctor',
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: InputDecoration(labelText: "Name of Doctor"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  height: 40.0,
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () async {
                    _fbKey.currentState.save();
                    if (_fbKey.currentState.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                      Patient newPatient = Patient(
                          name: _fbKey.currentState.value['name'],
                          age: int.parse(_fbKey.currentState.value['age']),
                          condition: _fbKey.currentState.value['condition'],
                          doctor: _fbKey.currentState.value['doctor']);
                      DatabaseProvider.db.addPatientToDatabase(newPatient);
                      Navigator.pop(context);
                    }
                  },
                ),
                MaterialButton(
                  height: 40.0,
                  child: Text(
                    "Reset",
                    style: TextStyle(color: Colors.white),
                  ),
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
    );
  }
}
