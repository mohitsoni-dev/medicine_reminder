import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meds_reminder/DrawerClass.dart';
import 'package:meds_reminder/BottomNavScreens/FilesPage.dart';
import 'package:meds_reminder/BottomNavScreens/MedicationPage.dart';
import 'package:meds_reminder/FormScreens/PatientAddForm.dart';
import 'package:meds_reminder/BottomNavScreens/SettingsPage.dart';
import 'package:meds_reminder/BottomNavScreens/Dashboard.dart';

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
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.dashboard,
          Icons.medical_services,
          Icons.settings,
          Icons.person,
        ],
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
