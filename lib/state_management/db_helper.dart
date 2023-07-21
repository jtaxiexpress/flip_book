import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/flip_book.dart';

class DbHelper {
  static DbHelper instance = DbHelper._init();
  DbHelper._init();
  Database? _database;
  static String dbName = "flip.db";
  static String tableName = "flipBooks";
  Future<Database> get database async => _database ??= await openDatabase(
        join(await getDatabasesPath(), dbName),
        version: 1,
        onCreate: _onCreate,
      );

  Future<void> _onCreate(Database db, int version) async {
    String query = '''
                  CREATE TABLE $tableName(
                    id TEXT PRIMARY KEY,
                    title TEXT,
                    creationDate TEXT,
                    imageUrls TEXT,
                    imagesDirPath TEXT,
                    hasFlipAnimation INTEGER
                  )
                  ''';
    await db.execute(query);
    print("Table created");
  }

  Future<void> insertFlipBook(FlipBook flipBook) async {
    final db = await database;
    var result = await db.insert(tableName, flipBook.toJson());
    print("data inserted ${result}");
  }

  Future<void> updateFlipBook(FlipBook flipBook) async {
    final db = await instance.database;
    var result = await db.update(
      tableName,
      flipBook.toJson(),
      where: 'id=?',
      whereArgs: [flipBook.id],
    );
    print("data inserted ${result}");
  }

  Future<void> deleteFlipBook(String id) async {
    final db = await instance.database;
    var result = await db.delete(
      tableName,
      where: 'id=?',
      whereArgs: [id],
    );
    print("data deleted ${result}");
  }

  Future<List<FlipBook>> getAllFlipBooks() async {
    List<FlipBook> flipBooks = [];
    final db = await database;
    try {
      final result = await db.query(tableName);
      for (final data in result) {
        final flipBook = FlipBook.fromJson(data);
        flipBooks.add(flipBook);
      }
      print("All flips loaded");
    } catch (e) {
      print("Exception while getting flips books: $e");
    }
    return flipBooks;
  }

  Future<bool> recordExists(FlipBook flipBook) async {
    final db = await database;
    final result =
        await db.query(tableName, where: 'id = ?', whereArgs: [flipBook.id]);
    return result.isNotEmpty;
  }

  void flushDb() async {
    final db = await database;
    // db.close();
    // await db.execute('DROP TABLE IF EXISTS $tableName');
    await deleteDatabase(db.path);
    print("$dbName database flushed successfully");
  }
}
