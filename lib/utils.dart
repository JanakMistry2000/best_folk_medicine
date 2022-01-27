import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'flavor_config.dart';
import 'models/article_datamodel.dart';
import 'models/category_data_model.dart';

GlobalKey<NavigatorState> incdecnavi = GlobalKey();

class Utils {
  static GlobalKey<NavigatorState> mainappnavi = GlobalKey();
  static String favouritetitle = '';

  static void dprint(String meg) {
    if (FlavorConfig.isDevelop()) {
      print(meg);
    }
  }

  /// This method is used for fetching article data
  static Future<List<ArticleDataModel>> getArticles() async {
    List<ArticleDataModel> data = <ArticleDataModel>[];
    String data1;
    late final dynamic jsonResult;
    if (FlavorConfig.isDevelop()) {
      data1 = await rootBundle.loadString("lib/assets/data/article_data.json");
      jsonResult = await jsonDecode(data1);
    } else if (FlavorConfig.isLive()) {
      /// for getting data from API
      data1 = await rootBundle.loadString("lib/assets/data/article_data.json");
      jsonResult = await jsonDecode(data1);
    }

    for (var article in jsonResult) {
      ArticleDataModel tmp = ArticleDataModel(
          id: article['id'].toString(),
          title: article['title'],
          image: article['image'],
          author: article['author'],
          category: article['category'],
          timeofupload: article['timeofupload'],
          description: article['description']);
      data.add(tmp);
    }
    return data;
  }

  /// This method is used for fetching category data
  static Future<List<CategoryDataModel>> getCategory() async {
    List<CategoryDataModel> data = <CategoryDataModel>[];
    String data1;
    late final dynamic jsonResult;
    if (FlavorConfig.isDevelop()) {
      data1 = await rootBundle.loadString("lib/assets/data/category_data.json");
      jsonResult = await jsonDecode(data1);
    } else if (FlavorConfig.isLive()) {
      /// for getting data from API
      data1 = await rootBundle.loadString("lib/assets/data/category_data.json");
      jsonResult = await jsonDecode(data1);
    }

    for (var article in jsonResult) {
      CategoryDataModel tmp = CategoryDataModel(
          id: article['id'].toString(), name: article['name']);
      data.add(tmp);
    }
    return data;
  }
}
