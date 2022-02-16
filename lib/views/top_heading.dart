import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../apis/api_services.dart';
import '../components/article_card.dart';
import '../components/article_card_live.dart';
import '../flavor_config.dart';
import '../models/articles_model.dart';
import '../utils.dart';

class TopHeading extends StatefulWidget {
  const TopHeading({Key? key}) : super(key: key);

  @override
  _TopHeadingState createState() => _TopHeadingState();
}

class _TopHeadingState extends State<TopHeading> {
  @override
  Widget build(BuildContext context) {
    late ResponseData response;
    return SizedBox(
      height: 320,
      child: FutureBuilder(
        future: FlavorConfig.isDevelop()
            ? Utils.getArticles()
            : Provider.of<ArticleApiService>(context).getHeadlines(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator.adaptive(),
              ],
            );
          } else {
            if (snapshot.data.body != null) {
              if (FlavorConfig.isLive()) {
                response = snapshot.data.body;
              }
              return ListView.builder(
                itemCount: FlavorConfig.isDevelop()
                    ? snapshot.data.length
                    : response.articles!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return FlavorConfig.isDevelop()
                      ? ArticleCard(snapshot.data[index])
                      : ArticleCardLive(response.articles![index]);
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
