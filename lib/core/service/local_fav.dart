import 'package:dominos/model/fav_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabaseFavourit {
  LocalDatabaseFavourit._();

  static final LocalDatabaseFavourit db = LocalDatabaseFavourit._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDbFavvv();
    return _database!;
  }

  Future<Database> initDbFavvv() async {
    String _path = join(await getDatabasesPath(), 'fav.db');

    Database _database = await openDatabase(_path, version: 2,
        onCreate: (Database db, int version) async {
          await db.execute('''
        CREATE TABLE fav (
        name TEXT NOT NULL,
        image TEXT NOT NULL,
        time TEXT NOT NULL,
        productId TEXT NOT NULL)
      ''');
        });

    return _database;
  }

  Future<List<FavModel>> getAllProducts() async {
    Database _db = await database;
    List<Map> _maps = await _db.query('fav');

    List<FavModel> _list = _maps.isNotEmpty
        ? _maps.map((fav) => FavModel.fromJson(fav)).toList()
        : [];
    return _list;
  }

  insertProduct(FavModel favModel) async {
    Database _db = await database;
    await _db.insert(
      'fav',
      favModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  deleteProduct(String productId) async {
    Database _db = await database;
    await _db.delete(
      'fav',
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }

  update(FavModel favModel) async {
    Database _db = await database;
    await _db.update(
      'fav',
      favModel.toJson(),
      where: 'productId = ?',
      whereArgs: [favModel.productId],
    );
  }
}