import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseSetup {
  static Database? _database;

  // Default constructor (implicitly added unless another constructor is defined)
  DatabaseSetup();

  Future<void> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'students.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, rollNo INTEGER)',
        );
      },
    );
  }

  static Database? get database => _database;
}
