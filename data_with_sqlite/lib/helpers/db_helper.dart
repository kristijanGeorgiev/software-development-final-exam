// lib/helpers/db_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/dog.dart';

class DBHelper {
  static Future<Database> openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'dog_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertDog(Dog dog) async {
    final db = await openDB();
    await db.insert('dogs', dog.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Dog>> getDogs() async {
    final db = await openDB();
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  static Future<void> updateDog(Dog dog) async {
    final db = await openDB();
    await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }

  static Future<void> deleteDog(int id) async {
    final db = await openDB();
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }
}


