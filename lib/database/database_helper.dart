import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/articles_model.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'articleDB.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Article ("
          "id integer primary key AUTOINCREMENT,"
          "author TEXT,"
          "title TEXT,"
          "description TEXT,"
          "urlToImage TEXT,"
          "publishedAt TEXT,"
          "content TEXT"
          ")");
    });
  }

  Future<List<Articles>> getAllArticles() async {
    final db = await database;
    var response = await db!.query("Article");
    List<Articles> list = response.map((e) => Articles.fromJson(e)).toList();
    return list;
  }

  Future<Articles?> getArticleWithId(int id) async {
    final db = await database;
    var response = await db!.query('Article', where: 'id= ?', whereArgs: [id]);
    return response.isNotEmpty ? Articles.fromJson(response.first) : null;
  }

  addArticle(Articles article) async {
    final db = await database;
    var dat = await db!.insert('Article', article.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return dat;
  }

  deleteArticle(int id) async {
    final db = await database;
    return db!.delete('Article', where: 'id=?', whereArgs: [id]);
  }
}
