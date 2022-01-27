import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../apis/retrofit_api.dart';
import '../components/article_card_thin_live.dart';
import '../flavor_config.dart';
import '../mobx/mobx_store.dart';
import '../models/articles_model.dart';

class OtherArticles extends StatefulWidget {
  final bool onhome;

  const OtherArticles({Key? key, this.onhome = false}) : super(key: key);

  @override
  _OtherArticlesState createState() => _OtherArticlesState();
}

class _OtherArticlesState extends State<OtherArticles> {
  final client = ApiClient(Dio(BaseOptions()));
  late Future data;
  late MobxStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<MobxStore>(context);
    if (FlavorConfig.isDevelop()) {
      store.getMockData();
    }
  }

  @override
  Widget build(BuildContext context) {
    late ResponseData? response;
    return Container(
      height: 500,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Observer(
        builder: (context) {
          switch (store.otherArticleData!.status) {
            case FutureStatus.pending:
              return const Center(child: CircularProgressIndicator());
            case FutureStatus.rejected:
              return const Center(child: CircularProgressIndicator());
            case FutureStatus.fulfilled:
              response = store.otherArticleData!.value!.body;
              if (response == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return GridView.count(
                padding: const EdgeInsets.all(0.0),
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.6,
                children: List.generate(

                    /// show flavor based data here
                    response!.articles!.length,
                    (index) => ArticleCardThinLive(
                        dataModel: response!.articles![index],
                        onhome: widget.onhome)),
              );
          }
        },
      ),
    );
  }
}
