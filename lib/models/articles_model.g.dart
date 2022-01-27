// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Articles _$ArticlesFromJson(Map<String, dynamic> json) => Articles(
      author: json['author'] as String? ?? 'unknown',
      title: json['title'] as String? ?? 'unknown',
      source: json['source'] as Map<String, dynamic>? ??
          const {'id': 'unknown', 'name': 'unknown'},
      description: json['description'] as String? ?? 'unknown',
      urlToImage: json['urlToImage'] as String? ??
          'https://media.istockphoto.com/photos/sample-red-grunge-round-stamp-on-white-background-picture-id491520707?k=20&m=491520707&s=612x612&w=0&h=b_KK4QHA7hqLwUN_gj4lQNRhx2c9vsibJyz5xO0Cvww=',
      publishedAt: json['publishedAt'] as String? ?? 'unknown',
      content: json['content'] as String? ?? 'unknown',
    );

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'author': instance.author,
      'source': instance.source,
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int? ?? -1,
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => Articles.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Articles>[],
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
