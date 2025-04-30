import 'package:sembast/sembast.dart';
import '../models/student_model.dart';
import '../setup/database_setup.dart';
class StudentDao {
  static const String STORE_NAME = 'students';
  final _store = intMapStoreFactory.store(STORE_NAME);

  Future insertStudent(Student student) async {
    final db = await AppDatabase.database;
    await _store.add(db, student.toMap());
    print("✅ Successful student insertion: ${student.name}");
  }

  Future<List<Student>> getAllStudents() async {
    final db = await AppDatabase.database;
    final records = await _store.find(db);
    final students = records.map((e) => Student.fromMap(e.value)).toList();
    print("📦 Retrieved Students:");
    for (var student in students) {
      print("ID: ${student.id}, Name: ${student.name}, Age: ${student.age}");
    }
    return students;
  }
}
