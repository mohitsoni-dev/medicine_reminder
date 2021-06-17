import 'dart:io';
import 'package:meds_reminder/database/models/Patient.dart';
import 'package:meds_reminder/database/models/Reminder.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "patient.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Patient(id integer primary key AUTOINCREMENT, name TEXT, age integer, doctor TEXT, condition TEXT)");
      await db.execute(
          "CREATE TABLE Reminder(id integer primary key AUTOINCREMENT, medname TEXT, timings integer)");
      await db.execute(
          "INTER INTO Reminder values(\"Limcee\", 3)");
      await db.execute(
          "INTER INTO Reminder values(\"Doxy 650\", 2)");
      await db.execute(
          "INTER INTO Reminder values(\"Ivermictlin\", 1)");

        });

  }

  addPatientToDatabase(Patient patient) async {
    final db = await database;
    var raw = await db.insert(
      "Patient",
      patient.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return raw;
  }

  Future<List<Patient>> getAllPatients() async {
    final db = await database;
    var response = await db.query("Patient");
    List<Patient> list = response.map((c) => Patient.fromMap(c)).toList();
    return list;
  }

  Future<Patient> getPatientWithID(int id) async {
    final db = await database;
    var response = await db.query("Patient", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? Patient.fromMap(response.first) : null;
  }
  Future<List<Reminder>> getAllReminders() async {
    final db = await database;
    var response = await db.query("Reminder");
    List<Reminder> list = response.map((c) => Reminder.fromMap(c)).toList();
    return list;
  }
}
