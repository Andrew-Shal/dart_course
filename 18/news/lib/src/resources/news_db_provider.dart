import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/item_model.dart';
import 'repository.dart';

class NewsDbProvider implements Source, Cache {
  Database db;

  NewsDbProvider() {
    init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'items5.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          CREATE TABLE Items
          (
            id INTEGER PRIMARY KEY,
            type TEXT,
            by TEXT,
            time INTEGER,
            kids BLOB,
            url TEXT,
            score INTEGER,
            title TEXT,
            descendants INTEGER,
            deleted INTEGER,
            text TEXT,
            dead INTEGER,
            parent INTEGER
          )
          """);
      },
    );
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      print('data:${maps.first}');
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert("Items", item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  clear() {
    return db.delete('Items');
  }

  Future<List<int>> fetchTopIds() {
    // ignore: todo
    // TODO: implement fetchTopIds
    throw UnimplementedError();
  }
}

final NewsDbProvider newsDbProvider = NewsDbProvider();
