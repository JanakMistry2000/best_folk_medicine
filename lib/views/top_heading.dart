import 'package:best_folk_medicine/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../components/article_card_live.dart';
import '../mobx/mobx_store.dart';
import '../models/articles_model.dart';
import '../strings.dart';

class TopHeading extends StatefulWidget {
  const TopHeading({Key? key}) : super(key: key);

  @override
  _TopHeadingState createState() => _TopHeadingState();
}

class _TopHeadingState extends State<TopHeading> {
  late MobxStore store;
  Future? data;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<MobxStore>(context);
    if (FlavorConfig.isDevelop()) {
      store.getMockData();
    } else {
      store.getHeadLines();
    }
  }

  @override
  Widget build(BuildContext context) {
    late ResponseData response;
    return SizedBox(
      height: 320,
      child: Observer(
        builder: (context) {
          switch (store.topHeadings!.status) {
            case FutureStatus.pending:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case FutureStatus.rejected:
              return const Center(
                child: Text(AppString.error401),
              );
            case FutureStatus.fulfilled:
              if (store.topHeadings!.value!.body == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              response = store.topHeadings!.value!.body!;
              return ListView.builder(
                /// Add condition for flavor based data count below
                itemCount: response.articles!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  /// Implement flavor based ui call here
                  return ArticleCardLive(response.articles![index]);
                },
              );
          }
        },
      ),
    );
  }
}
