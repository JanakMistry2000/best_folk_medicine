import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../apis/retrofit_api.dart';
import '../components/article_card_thin.dart';
import '../components/article_card_thin_live.dart';
import '../flavor_config.dart';
import '../models/articles_model.dart';
import '../utils.dart';

class OtherArticles extends StatefulWidget {
  final int pageNo;
  final bool onhome;

  const OtherArticles({Key? key, required this.pageNo, this.onhome = false})
      : super(key: key);

  @override
  _OtherArticlesState createState() => _OtherArticlesState();
}

class _OtherArticlesState extends State<OtherArticles> {
  final client = ApiClient(Dio(BaseOptions()));
  late Future data;

  @override
  void initState() {
    super.initState();
    data = FlavorConfig.isDevelop()
        ? Utils.getArticles()
        : client.getSuggested('bbc.co.uk', widget.pageNo);
  }

  @override
  Widget build(BuildContext context) {
    late ResponseData response;
    return Container(
      height: 500,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const CircularProgressIndicator.adaptive();
          } else {
            if (snapshot.hasData) {
              int totalResults = 0;
              if (FlavorConfig.isDevelop()) {
                totalResults =
                    snapshot.data.length < 4 ? snapshot.data.length : 4;
              } else if (FlavorConfig.isLive()) {
                response = snapshot.data;
                totalResults = response.articles!.length < 4
                    ? response.articles!.length
                    : 4;
              }
              return GridView.count(
                padding: const EdgeInsets.all(0.0),
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.6,
                children: List.generate(
                    totalResults,
                    (index) => FlavorConfig.isDevelop()
                        ? ArticleCardThin(
                            dataModel: snapshot.data[index],
                            tag: 'fromhome',
                          )
                        : ArticleCardThinLive(
                            dataModel: response.articles![index],
                            pageNo: widget.pageNo,
                            onhome: widget.onhome)),
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
