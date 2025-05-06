import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._();
  AppDatabase._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    final dir = await getApplicationDocumentsDirectory();
    final dbPath = '${dir.path}/fruit.db';

    _database = await databaseFactoryIo.openDatabase(dbPath);
    return _database!;
  }
}
