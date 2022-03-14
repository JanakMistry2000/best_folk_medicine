import 'package:hive_flutter/hive_flutter.dart';

import '../models/article_hive.dart';
import '../models/articles_model.dart';

class DatabaseHive {
  List<Articles> getAllData() {
    var hiveArts = Hive.box('articles').values;
    List<Articles> articlesData = [];
    List<ArticleHive> artHive = [...hiveArts];
    for (var element in artHive) {
      articlesData.add(Articles.fromHive(element));
    }
    return articlesData;
  }
}
