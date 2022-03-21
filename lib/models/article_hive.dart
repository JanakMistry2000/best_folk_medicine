import 'package:best_folk_medicine/models/articles_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'article_hive.g.dart';

@HiveType(typeId: 0)
class ArticleHive {
  @HiveField(0)
  late String author;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String description;
  @HiveField(3)
  late String urlToImage;
  @HiveField(4)
  late String publishedAt;
  @HiveField(5)
  late String content;

  ArticleHive(this.author, this.title, this.description, this.urlToImage,
      this.publishedAt, this.content);

  ArticleHive.fromArticles(Articles articles) {
    author = articles.author!;
    title = articles.title!;
    urlToImage = articles.urlToImage!;
    publishedAt = articles.publishedAt!;
    content = articles.content!;
    description = articles.description!;
  }
}
