import 'package:flutter/material.dart';
import 'package:meds_reminder/database/database.dart';
import 'package:meds_reminder/database/models/Patient.dart';

class DrawerClass extends StatefulWidget {
  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  List<Patient> allPatients = [];

  @override
  void initState() {
    getAllPatients();
    super.initState();
  }

  getAllPatients() async {
    allPatients = await DatabaseProvider.db.getAllPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          FutureBuilder<List<Patient>>(
            future: DatabaseProvider.db.getAllPatients(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Patient>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Patient patient = snapshot.data[index];
                    return ListTile(
                      title: Text(patient.name),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                      trailing: Switch(
                        value: true,
                        onChanged: (bool newVal) {},
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
// ListTile(
//             title: Text('Father'),
//             onTap: () {
//               // Update the state of the app.
//               // ...
//             },
//             trailing: Switch(
//               value: true,
//               onChanged: (bool newVal) {},
//             ),
//           ),
         
//           ListTile(
//             title: Text('Mother'),
//             onTap: () {
//               // Update the state of the app.
//               // ...
//             },
//             trailing: Switch(
//               value: true,
//               onChanged: (bool newVal) {},
//             ),
//           ),