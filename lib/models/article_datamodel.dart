class ArticleDataModel {
  int? id;
  String title;
  String urlToImage;
  String author;
  String publishedAt;
  String description;
  String content;

  ArticleDataModel(
      {this.id,
      required this.title,
      required this.urlToImage,
      required this.author,
      required this.publishedAt,
      required this.description,
      required this.content});

  factory ArticleDataModel.fromMap(Map<String, dynamic> json) =>
      ArticleDataModel(
          title: json['title'],
          urlToImage: json['urlToImage'],
          author: json['author'],
          publishedAt: json['publishedAt'],
          description: json['description'],
          content: json['content']);

  Map<String, dynamic> toMap() => {
        'author': author,
        'urlToImage': urlToImage,
        'description': description,
        'content': content,
        'title': title,
        'publishedAt': publishedAt
      };
}
