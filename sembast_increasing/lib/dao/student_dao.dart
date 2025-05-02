import 'package:sqflite/sqflite.dart';
import '../models/student_model.dart';
import '../setup/database_setup.dart';

class StudentDao {
  Future<void> insertStudent(Student student) async {
    final db = DatabaseSetup.database;
    await db?.insert(
      'students',
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Student>> getAllStudents() async {
    final db = DatabaseSetup.database;
    final List<Map<String, dynamic>> maps = await db?.query('students') ?? [];
    return List.generate(maps.length, (i) {
      return Student.fromMap(maps[i]);
    });
  }
}
