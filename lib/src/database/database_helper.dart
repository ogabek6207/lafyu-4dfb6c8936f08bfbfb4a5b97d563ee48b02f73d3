import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/api/product_list_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableFav = 'favTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnPrice = 'price';
  final String columnBasePrice = 'base_price';
  final String columnImage = 'image';
  final String columnAvg = 'review_avg';

  static Database? _db;

  DatabaseHelper.internal();

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
      'CREATE TABLE $tableFav('
      '$columnId INTEGER PRIMARY KEY, '
      '$columnName TEXT, '
      '$columnImage TEXT, '
      '$columnPrice REAL, '
      '$columnBasePrice REAL, '
      '$columnAvg REAL)',
    );
  }

  Future<int> saveProducts(ProductListResult item) async {
    var dbClient = await db;
    var re = await dbClient.insert(
      tableFav,
      item.toJson(),
    );
    return re;
  }

  Future<List<ProductListResult>> getProduct() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableFav');
    List<ProductListResult> products = <ProductListResult>[];
    for (int i = 0; i < list.length; i++) {
      var items = ProductListResult(
        id: list[i][columnId],
        name: list[i][columnName],
        price: list[i][columnPrice],
        images: ProductSaleImages(
          image: list[i][columnImage],
        ),
        reviewAvg: list[i][columnAvg],
        discountPrice: list[i][columnBasePrice],
      );
      products.add(items);
    }
    return products;
  }

  Future<int> deleteProducts(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableFav,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateProduct(ProductListResult products) async {
    var dbClient = await db;
    return await dbClient.update(
      tableFav,
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
    await dbClient.rawQuery('DELETE FROM $tableFav');
  }
}
