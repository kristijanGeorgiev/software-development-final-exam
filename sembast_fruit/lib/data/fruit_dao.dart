import 'package:sembast/sembast.dart';
import 'app_database.dart';
import 'fruit.dart';

class FruitDao {
  static const String storeName = 'fruits';
  final _store = intMapStoreFactory.store(storeName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<void> insertFruit(Fruit fruit) async {
    await _store.record(fruit.id).put(await _db, fruit.toMap());
    print('Fruit Inserted Successfully');
  }

  Future<void> updateFruit(Fruit fruit) async {
    final finder = Finder(filter: Filter.equals('id', fruit.id));
    await _store.update(await _db, fruit.toMap(), finder: finder);
    print('Fruit Updated Successfully');
  }

  Future<void> deleteFruit(Fruit fruit) async {
    final finder = Finder(filter: Filter.equals('id', fruit.id));
    await _store.delete(await _db, finder: finder);
    print('Fruit Deleted Successfully');
  }

  Future<List<Fruit>> getAllSortedByName() async {
    final finder = Finder(sortOrders: [SortOrder('name')]);
    final recordSnapshots = await _store.find(await _db, finder: finder);

    return recordSnapshots.map((snapshot) {
      return Fruit.fromMap(snapshot.value);
    }).toList();
  }
}
