import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'dart:io';

class AppDatabase {
  static Database? _db;

  static Future<Database> get database async {
    if (_db == null) {
      await dir.create(recursive: true);
    }
    return _db!;
  }
}
