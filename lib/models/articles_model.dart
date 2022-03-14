import 'package:best_folk_medicine/database/database_moor.dart';
import 'package:best_folk_medicine/models/article_hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'articles_model.g.dart';

@JsonSerializable()
class Articles {
  int? id = 0;
  String? author;
  Map<String, dynamic>? source;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.author = 'unknown',
      this.title = 'unknown',
      this.source = const {'id': 'unknown', 'name': 'unknown'},
      this.description = 'unknown',
      this.urlToImage =
          'https://media.istockphoto.com/photos/sample-red-grunge-round-stamp-on-white-background-picture-id491520707?k=20&m=491520707&s=612x612&w=0&h=b_KK4QHA7hqLwUN_gj4lQNRhx2c9vsibJyz5xO0Cvww=',
      this.publishedAt = 'unknown',
      this.content = 'unknown'});

  Articles.fromHive(ArticleHive articleHive) {
    author = articleHive.author;
    title = articleHive.title;
    content = articleHive.content;
    description = articleHive.description;
    publishedAt = articleHive.publishedAt;
    urlToImage = articleHive.urlToImage;
  }

  Articles.fromMoor(ArticlesMoor articlesMoor) {
    author = articlesMoor.author;
    title = articlesMoor.title;
    content = articlesMoor.content;
    description = articlesMoor.description;
    publishedAt = articlesMoor.publishedAt;
    urlToImage = articlesMoor.urlToImage;
    id = articlesMoor.id;
  }

  factory Articles.fromJson(Map<String, dynamic> json) {
    return _$ArticlesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);

  Map<String, dynamic> toMap() => {
        'author': author,
        'urlToImage': urlToImage,
        'description': description,
        'content': content,
        'title': title,
        'publishedAt': publishedAt
      };
}

@JsonSerializable()
class ResponseData {
  String status;
  int? totalResults;
  List<Articles>? articles;

  ResponseData(
      {required this.status,
      this.totalResults = -1,
      this.articles = const <Articles>[]});

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
