import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddMedicineForm extends StatefulWidget {
  @override
  _AddMedicineFormState createState() => _AddMedicineFormState();
}

class _AddMedicineFormState extends State<AddMedicineForm> {
  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _fbKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context); if (!currentFocus.hasPrimaryFocus) { currentFocus.unfocus(); }
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Add Information on your Medication"),
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
                          name: 'text',
                          style: Theme.of(context).textTheme.bodyText1,
                          validator: FormBuilderValidators.compose(
                              [FormBuilderValidators.required(context)]),
                          decoration: InputDecoration(labelText: "Medicine Name"),
                        ),
                        FormBuilderTextField(
                          name: "dosage",
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: InputDecoration(labelText: "Dosage in MG"),
                          keyboardType: TextInputType.number,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.numeric(context),
                            FormBuilderValidators.max(context, 70),
                          ]),
                        ),
                        FormBuilderSegmentedControl(
                          decoration: InputDecoration(
                            labelText: "Priscription per day",
                            labelStyle: Theme.of(context).textTheme.bodyText1,
                          ),
                          options: [
                            FormBuilderFieldOption(
                              value: 'pill',
                              child: Container(
                                width: 50,
                                height: 25,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // TODO:// Add Icons Here!!
                                    // Icon(Icons.medication_outlined),
                                    Text(
                                      'Pill',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            FormBuilderFieldOption(
                              value: 'syrup',
                              child: Container(
                                width: 80,
                                height: 25,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // TODO:// Add Icons Here!!
                                    //Icon(Icons.local_drink_outlined),
                                    Text(
                                      "Syrup",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            FormBuilderFieldOption(
                              value: 'injection',
                              child: Container(
                                width: 100,
                                height: 25,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // TODO:// Add Icons Here!!
                                    //Icon(Icons.mode_edit_outline_outlined),
                                    Text(
                                      "Injection",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                  ),
                ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                        onPressed: () {
                          _fbKey.currentState.save();
                          if (_fbKey.currentState.validate()) {
                            print(_fbKey.currentState.value);
                          }
                        },
                      ),
                      MaterialButton(
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
          ),
        ),
      ),
    );
  }
}
