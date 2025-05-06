import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'dart:io';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._internal();
  Database? _db;

  AppDatabase._internal();

  static AppDatabase get instance => _singleton;

  Future<Database> get database async {
    if (_db != null) return _db!;
    return await _initDb();
  }

  Future<Database> _initDb() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String dbPath = join(dir.path, 'students.db');
    _db = await databaseFactoryIo.openDatabase(dbPath);
    return _db!;
  }
}