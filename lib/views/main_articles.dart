import 'package:best_folk_medicine/flavor_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../apis/retrofit_api.dart';
import '../components/article_tile_live.dart';
import '../mobx/mobx_store.dart';
import '../models/articles_model.dart';

class MainArticles extends StatefulWidget {
  const MainArticles({Key? key}) : super(key: key);

  @override
  _MainArticlesState createState() => _MainArticlesState();
}

class _MainArticlesState extends State<MainArticles> {
  final client = ApiClient(Dio(BaseOptions()));
  late Future data;
  late MobxStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<MobxStore>(context);
    if (FlavorConfig.isDevelop()) {
      store.getMockData();
    } else {
      store.getData('bbc.co.uk', pageno: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    late ResponseData response;
    return Container(
      height: 400,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Observer(
        builder: (context) {
          switch (store.generalArticleData!.status) {
            case FutureStatus.pending:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case FutureStatus.rejected:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case FutureStatus.fulfilled:
              if (store.generalArticleData!.value!.body == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              response = store.generalArticleData!.value!.body!;
              return ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: response.articles!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  /// show flavor based ui call here
                  return ArticleTileLive(dataModel: response.articles![index]);
                },
              );
          }
        },
      ),
    );
  }
}
