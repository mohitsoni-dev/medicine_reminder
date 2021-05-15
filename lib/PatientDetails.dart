import 'package:flutter/material.dart';
import 'package:meds_reminder/constants/TextConstants.dart';
import 'package:meds_reminder/database/models/Patient.dart';
import 'package:path/path.dart';

class PatientDetails extends StatefulWidget {
  final Patient patient;
  PatientDetails({@required this.patient});

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  List<dynamic> medicines = [
    {
      'image':
          'https://image.shutterstock.com/image-vector/doctor-pharmacist-drugstore-standing-near-600w-1507462133.jpg',
      'name': 'Dolo-500',
      'dosage': 500,
    },
    {
      'image':
          'https://image.shutterstock.com/image-vector/doctor-pharmacist-drugstore-standing-near-600w-1507462133.jpg',
      'name': 'Limcee',
      'dosage': 200,
    },
    {
      'image':
          'https://image.shutterstock.com/image-vector/doctor-pharmacist-drugstore-standing-near-600w-1507462133.jpg',
      'name': 'Remdesivir',
      'dosage': 0.5,
    },
    {
      'image':
          'https://image.shutterstock.com/image-vector/doctor-pharmacist-drugstore-standing-near-600w-1507462133.jpg',
      'name': 'Zincovit',
      'dosage': 100,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.patient.name}\'s Details'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add reminder
        },
        tooltip: 'Add Mdicine Reminder',
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Medicines: ',
              style: kHeadingStyle,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: medicines.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(medicines[index]['image']),
                ),
                title: Text(medicines[index]['name']),
                subtitle: Text(medicines[index]['dosage'].toString() + "mg"),
                trailing: Icon(Icons.delete),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              );
            },
          ),
        ],
      ),
    );
  }
}
