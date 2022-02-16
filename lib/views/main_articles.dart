import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../apis/retrofit_api.dart';
import '../components/article_tile.dart';
import '../components/article_tile_live.dart';
import '../flavor_config.dart';
import '../models/articles_model.dart';
import '../utils.dart';

class MainArticles extends StatefulWidget {
  const MainArticles({Key? key}) : super(key: key);

  @override
  _MainArticlesState createState() => _MainArticlesState();
}

class _MainArticlesState extends State<MainArticles> {
  final client = ApiClient(Dio(BaseOptions()));
  late Future data;

  @override
  void initState() {
    super.initState();
    data = FlavorConfig.isDevelop()
        ? Utils.getArticles()
        : client.getEverything("bbc.co.uk", 1);
  }

  @override
  Widget build(BuildContext context) {
    late ResponseData response;
    return Container(
      height: 400,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const CircularProgressIndicator.adaptive();
          } else {
            if (snapshot.hasData) {
              ///Calculating total results for dev flavor and live flavor
              int totalResults = 0;
              if (FlavorConfig.isDevelop()) {
                totalResults =
                    snapshot.data.length < 3 ? snapshot.data.length : 3;
              } else if (FlavorConfig.isLive()) {
                response = snapshot.data;
                totalResults = response.articles!.length < 3
                    ? response.articles!.length
                    : 3;
              }
              return ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: totalResults,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return FlavorConfig.isDevelop()
                      ? ArticleTile(dataModel: snapshot.data[index])
                      : ArticleTileLive(dataModel: response.articles![index]);
                },
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator.adaptive(),
                ],
              );
            }
          }
        },
      ),
    );
  }
}
