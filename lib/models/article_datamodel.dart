class ArticleDataModel {
  String id;
  String title;
  String image;
  String author;
  String category;
  String timeofupload;
  String description;

  ArticleDataModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.author,
      required this.category,
      required this.timeofupload,
      required this.description});
}
