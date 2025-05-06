import 'package:sembast/sembast.dart';
import 'database_setup.dart';
import 'student_model.dart';

class StudentDao {
  static const String STORE_NAME = 'students';
  final _store = intMapStoreFactory.store(STORE_NAME);

  Future insertStudent(Student student) async {
    final db = await AppDatabase.instance.database;
    await _store.add(db, student.toMap());
    print('Student Inserted Successfully');
  }
  Future deleteStudent(Student student) async {
    final db = await AppDatabase.instance.database;
    final finder = Finder(filter: Filter.equals('id', student.id));
    await _store.delete(db, finder: finder);
    print('Student Deleted Successfully');
  }

  Future<List<Student>> getStudents() async {
    final db = await AppDatabase.instance.database;
    final snapshots = await _store.find(db);

    return snapshots.map((snapshot) {
      final student = Student.fromMap(snapshot.value);
      return student;
    }).toList();
  }
}
