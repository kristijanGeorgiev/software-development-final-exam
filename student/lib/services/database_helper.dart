import 'package:student/models/student_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Students.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE Student(id INTEGER PRIMARY KEY, name TEXT NOT NULL, code TEXT NOT NULL, email TEXT NOT NULL);"),
        version: _version);
  }

  static Future<int> addStudent(Student student) async {
    final db = await _getDB();
    return await db.insert("Student", student.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateStudent(Student student) async {
    final db = await _getDB();
    return await db.update("Student", student.toJson(),
        where: 'id = ?',
        whereArgs: [student.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteStudent(Student student) async {
    final db = await _getDB();
    return await db.delete(
      "Student",
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  static Future<List<Student>?> getAllStudents() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Student");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Student.fromJson(maps[index]));
  }
}