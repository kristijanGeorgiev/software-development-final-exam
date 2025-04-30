import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'dart:io';

class AppDatabase {
  static Database? _db;

  static Future<Database> get database async {
    if (_db == null) {
      final dir = await getApplicationDocumentsDirectory();
      await dir.create(recursive: true);
      final dbPath = join(dir.path, 'students.db');
      _db = await databaseFactoryIo.openDatabase(dbPath);
    }
    return _db!;
  }
}
