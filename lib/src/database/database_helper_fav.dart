import 'dart:async';
import 'package:lafyu/src/model/database/fav_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperFav {
  static final DatabaseHelperFav _instance = DatabaseHelperFav.internal();

  factory DatabaseHelperFav() => _instance;

  final String tableNote = 'cardTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnImage = 'image';
  final String columnPrice = 'price';
  final String columnBasePrice = 'base_price';
  final String columnStart = 'start';

  static Database? _db;

  DatabaseHelperFav.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'facDatabase.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $tableNote('
      '$columnId INTEGER PRIMARY KEY, '
      '$columnName TEXT, '
      '$columnImage TEXT, '
      '$columnPrice REAL, '
      '$columnBasePrice REAL, '
      '$columnStart REAL)',
    );
  }

  Future<int> saveProducts(FavDatabaseModel item) async {
    var dbClient = await db;
    var re = await dbClient.insert(
      tableNote,
      item.toJson(),
    );
    return re;
  }

  Future<List<FavDatabaseModel>> getProduct() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableNote');
    List<FavDatabaseModel> products = <FavDatabaseModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = FavDatabaseModel(
        id: list[i][columnId],
        name: list[i][columnName],
        price: list[i][columnPrice],
        images: list[i][columnImage],
        start: list[i][columnStart],
        discountPrice: list[i][columnBasePrice],
      );
      products.add(items);
    }
    return products;
  }

  Future<int> deleteProducts(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableNote,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateProduct(FavDatabaseModel products) async {
    var dbClient = await db;
    return await dbClient.update(
      tableNote,
      products.toJson(),
      where: "$columnId = ?",
      whereArgs: [products.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $tableNote');
  }
}
