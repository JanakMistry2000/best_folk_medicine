import 'dart:convert';
import '../strings.dart';
import '../components/article_card.dart';
import '../components/article_card_thin.dart';
import '../components/article_tile.dart';
import '../components/cateory_box.dart';
import '../components/custom_searchbar.dart';
import '../models/article_datamodel.dart';
import '../models/category_data_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<ArticleDataModel>> getArticles() async {
    List<ArticleDataModel> data = <ArticleDataModel>[];
    String data1 = await DefaultAssetBundle.of(context)
        .loadString("lib/assets/data/article_data.json");
    final jsonResult = await jsonDecode(data1);
    for (var article in jsonResult) {
      ArticleDataModel tmp = ArticleDataModel(
          id: article['id'],
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

  Future<List<CategoryDataModel>> getCategory() async {
    List<CategoryDataModel> data = <CategoryDataModel>[];
    String data1 = await DefaultAssetBundle.of(context)
        .loadString("lib/assets/data/category_data.json");
    final jsonResult = await jsonDecode(data1);
    for (var article in jsonResult) {
      CategoryDataModel tmp =
          CategoryDataModel(id: article['id'], name: article['name']);
      data.add(tmp);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  AppString.appname,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomSearchBar(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: getCategory(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryBox(dataModel: snapshot.data[index]);
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(AppString.mainArticle,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                  Text(AppString.seeMore)
                ],
              ),
            ),
            SizedBox(
              height: 320,
              child: FutureBuilder(
                future: getArticles(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator.adaptive(),
                      ],
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return ArticleCard(snapshot.data[index]);
                        },
                      );
                    } else {
                      return const Text(AppString.errorLoadingData);
                    }
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    AppString.notFinished,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  Text(AppString.seeMore)
                ],
              ),
            ),
            Container(
              height: 400,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: FutureBuilder(
                future: getArticles(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator.adaptive();
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(0.0),
                        itemCount: (snapshot.data.length < 3)
                            ? snapshot.data.length
                            : 3,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return ArticleTile(dataModel: snapshot.data[index]);
                        },
                      );
                    } else {
                      return const Text(AppString.errorLoadingData);
                    }
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(AppString.lastArticle,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                  Text(AppString.seeMore)
                ],
              ),
            ),
            Container(
              height: 500,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: FutureBuilder(
                future: getArticles(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator.adaptive();
                  } else {
                    if (snapshot.hasData) {
                      return GridView.count(
                        padding: const EdgeInsets.all(0.0),
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.6,
                        children: List.generate(
                            (snapshot.data.length < 4)
                                ? snapshot.data.length
                                : 4,
                            (index) => ArticleCardThin(
                                dataModel: snapshot.data[index])),
                      );
                    } else {
                      return const Text(AppString.errorLoadingData);
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
