import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../arguments.dart';
import '../colors.dart';
import '../database/database_helper.dart';
import '../database/database_moor.dart';
import '../flavor_config.dart';
import '../images.dart';
import '../mobx/mobx_store.dart';
import '../models/article_hive.dart';
import '../models/articles_model.dart';
import '../strings.dart';
import 'other_articles.dart';

class ArticleDetailLive extends StatefulWidget {
  const ArticleDetailLive({Key? key}) : super(key: key);

  @override
  _ArticleDetailLiveState createState() => _ArticleDetailLiveState();
}

class _ArticleDetailLiveState extends State<ArticleDetailLive> {
  IconData ico = Icons.star_border;
  late List<Articles> art;
  late dynamic args;
  bool fav = false;
  late int? id;
  late MobxStore store;
  late DatabaseMoor dbMoor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as ArticleDetailArguments;
    store = Provider.of<MobxStore>(context);
    switch (FlavorConfig.instance.flavor) {
      case Flavor.DEV:
        for (var element in store.localData!) {
          if (element.title == args.data.title!) {
            ico = Icons.star;
            fav = true;
            id = store.localData!.indexOf(element);
            break;
          }
        }
        break;
      case Flavor.LIVE:
        for (var element in store.localData!) {
          if (element.title == args.data.title!) {
            ico = Icons.star;
            fav = true;
            id = element.id;
            break;
          }
        }
        break;
      case Flavor.QA:
        dbMoor = Provider.of<DatabaseMoor>(context);
        for (var element in store.localData!) {
          if (element.title == args.data.title!) {
            ico = Icons.star;
            fav = true;
            id = element.id;
            break;
          }
        }
        break;
    }
  }

  /// Performing add or remove article operation from the localdata.
  Future update() async {
    if (fav) {
      fav = false;
      ico = Icons.star_border;
      switch (FlavorConfig.instance.flavor) {
        case Flavor.DEV:
          Hive.box(AppString.hiveDatabase).deleteAt(id!);
          store.deleteArticleFromLocal(id!);
          break;
        case Flavor.LIVE:
          DatabaseHelper.instance.deleteArticle(id!);
          store.deleteArticleFromLocal(id!);
          break;
        case Flavor.QA:
          dbMoor.deleteArticle(id!);
          store.deleteArticleFromLocal(id!);
          break;
      }
    } else {
      switch (FlavorConfig.instance.flavor) {
        case Flavor.DEV:
          Hive.box(AppString.hiveDatabase)
              .add(ArticleHive.fromArticles(args.data));
          store.addArticleToLocal(args.data);
          id = store.localData!.indexOf(args.data);
          break;
        case Flavor.LIVE:
          id = await DatabaseHelper.instance.addArticle(args.data);
          args.data.id = id;
          store.addArticleToLocal(args.data);
          break;
        case Flavor.QA:
          ArticlesMoor articlesMoor = ArticlesMoor.fromJson(args.data.toJson());
          id = await dbMoor.insertArticle(articlesMoor);
          args.data.id = id;
          store.addArticleToLocal(args.data);
          break;
      }
      fav = true;
      ico = Icons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            SafeArea(
              bottom: false,
              child: Container(
                width: double.infinity,
                height: 50,
                color: AppColor.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.arrow_back_ios_outlined),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppString.back,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )),
                      Row(
                        children: const [
                          Icon(Icons.share),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Hero(
                        tag: args.tag,
                        child: FlavorConfig.isDevelop()
                            ? Image.asset(
                                args.data.urlToImage!,
                                fit: BoxFit.cover,
                              )
                            : FadeInImage.assetNetwork(
                                placeholder: AppImage.loading,
                                fit: BoxFit.cover,
                                imageErrorBuilder:
                                    (context, object, stacktrace) {
                                  return const Icon(Icons.error_outline);
                                },
                                image: args.data.urlToImage!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            args.data.title!,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                  AppString.writtenby + args.data.author!)),
                          Expanded(
                              flex: 1,
                              child: Text(
                                  args.data.publishedAt!.split("T").first)),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () async {
                                  await update();
                                  setState(() {});
                                },
                                icon: Icon(ico)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(child: Text(args.data.description!))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [Expanded(child: Text(args.data.content!))],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(AppString.similararticle,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15)),
                          Text(AppString.seeMore)
                        ],
                      ),
                    ),
                    const OtherArticles(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
