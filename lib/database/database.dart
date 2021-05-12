import 'dart:io';
import 'package:meds_reminder/database/models/Patient.dart';
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

  Future<Patient> getPatientWithID(int id) async {
    final db = await database;
    var response = await db.query("Patient", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? Patient.fromMap(response.first) : null;
  }
}
