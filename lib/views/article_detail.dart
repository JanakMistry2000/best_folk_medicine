import 'package:best_folk_medicine/components/article_card_thin.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../models/article_datamodel.dart';
import '../strings.dart';
import '../utils.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({Key? key}) : super(key: key);

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArticleDataModel;
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
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Hero(
                          tag: args.id,
                          child: Image.asset(
                            args.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              args.title,
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
                                child: Text(AppString.writtenby + args.author)),
                            Expanded(flex: 1, child: Text(args.timeofupload)),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.star_border,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [Expanded(child: Text(args.description))],
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
                      Container(
                        height: 500,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FutureBuilder(
                          future: Utils.getArticles(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
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
                                            dataModel: snapshot.data[index],
                                            tag: 'fromarticledetail',
                                          )),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
