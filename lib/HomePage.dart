import 'package:flutter/material.dart';
import 'package:meds_reminder/DrawerClass.dart';
import 'package:meds_reminder/FilesPage.dart';
import 'package:meds_reminder/MedicationPage.dart';
import 'package:meds_reminder/PatientAddForm.dart';
import 'package:meds_reminder/SettingsPage.dart';
import 'package:meds_reminder/Dashboard.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<dynamic> screens = [
    DashBoardPage(),
    MedicationPage(),
    SettingsPage(),
    FilesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meds Reminder'),
      ),
      body: Center(
        child: screens[_selectedIndex],
      ),
      drawer: DrawerClass(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PatientAddForm()));
        },
        tooltip: 'Add a patient',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          elevation: 10.0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services),
              label: 'Medications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Files',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[600],
          unselectedItemColor: Colors.blue[200],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
