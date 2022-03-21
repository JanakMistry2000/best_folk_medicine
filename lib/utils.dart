import 'dart:convert';

import 'package:best_folk_medicine/models/articles_model.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'flavor_config.dart';
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
  static Future<Response<ResponseData>> getArticles() async {
    List<Articles> data2 = <Articles>[];
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
      Articles art = Articles.fromJson(article);
      data2.add(art);
    }
    Response<ResponseData> res = Response(
        http.Response('ok', 200), ResponseData(status: 'ok', articles: data2));
    return res;
    //return data;
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
    } else {
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
