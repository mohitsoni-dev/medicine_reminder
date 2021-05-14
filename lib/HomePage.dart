import 'package:flutter/material.dart';
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
      body: Center(
        child: Text("Upcoming reminders are displayed here"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.indigo],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                color: Colors.blue,
              ),
              child: Text(
                'Patient\'s Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.more),
              title: Text('More Details'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Details'),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
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
