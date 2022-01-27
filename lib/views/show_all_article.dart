import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../apis/retrofit_api.dart';
import '../colors.dart';
import '../components/article_card_thin_live.dart';
import '../flavor_config.dart';
import '../models/articles_model.dart';
import '../strings.dart';
import '../utils.dart';

class ShowAllArticles extends StatefulWidget {
  const ShowAllArticles({Key? key}) : super(key: key);

  @override
  _ShowAllArticlesState createState() => _ShowAllArticlesState();
}

class _ShowAllArticlesState extends State<ShowAllArticles> {
  final client = ApiClient(Dio(BaseOptions()));
  late Future data;
  late ResponseData response;

  @override
  void initState() {
    super.initState();
    data = FlavorConfig.isDevelop()
        ? Utils.getArticles()
        : client.getEverything('bbc.co.uk');
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
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
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
                          totalResults = snapshot.data.length;
                        } else if (FlavorConfig.isLive()) {
                          response = snapshot.data;
                          totalResults = response.articles!.length;
                        } else if (FlavorConfig.isQA()) {
                          response = snapshot.data;
                          totalResults = response.articles!.length;
                        }
                        return GridView.count(
                          padding: const EdgeInsets.all(0.0),
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.6,
                          children: List.generate(
                              totalResults,
                              (index) => ArticleCardThinLive(
                                    dataModel: response.articles![index],
                                    onhome: true,
                                  )),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
