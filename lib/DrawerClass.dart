import 'package:flutter/material.dart';

class DrawerClass extends StatefulWidget {
  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
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
          ListTile(
            title: Text('Father'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
            trailing: Switch(
              value: false,
              onChanged: (bool newVal) {
                newVal = true;
              },
            ),
          ),
          ListTile(
            title: Text('Grand Mother'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
            trailing: Switch(
              value: true,
              onChanged: (bool newVal) {},
            ),
          ),
          ListTile(
            title: Text('Mother'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
            trailing: Switch(
              value: true,
              onChanged: (bool newVal) {},
            ),
          ),
        ],
      ),
    );
  }
}
