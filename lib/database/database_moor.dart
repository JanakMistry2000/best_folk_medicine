import 'package:moor_flutter/moor_flutter.dart';

part 'database_moor.g.dart';

class ArticlesMoors extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();

  TextColumn get author => text()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get content => text()();

  TextColumn get publishedAt => text()();

  TextColumn get urlToImage => text()();
}

@UseMoor(tables: [ArticlesMoors])
class DatabaseMoor extends _$DatabaseMoor {
  DatabaseMoor()
      : super((FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite')));

  @override
  int get schemaVersion => 1;

  Future<List<ArticlesMoor>> getAllArticle() => select(articlesMoors).get();

  Future insertArticle(ArticlesMoor article) =>
      into(articlesMoors).insert(article);

  Future deleteArticle(int id) =>
      (delete(articlesMoors)..where((tbl) => tbl.id.equals(id))).go();
}
