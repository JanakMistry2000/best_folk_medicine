import 'package:json_annotation/json_annotation.dart';

part 'articles_model.g.dart';

@JsonSerializable()
class Articles {
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

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
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
