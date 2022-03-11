import 'package:best_folk_medicine/flavor_config.dart';
import 'package:flutter/material.dart';

import '../arguments.dart';
import '../colors.dart';
import '../strings.dart';
import 'other_articles.dart';

class ArticleDetailLive extends StatefulWidget {
  const ArticleDetailLive({Key? key}) : super(key: key);

  @override
  _ArticleDetailLiveState createState() => _ArticleDetailLiveState();
}

class _ArticleDetailLiveState extends State<ArticleDetailLive> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ArticleDetailArguments;
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
                          tag: args.data.title!,
                          child: FlavorConfig.isDevelop()
                              ? Image.asset(
                                  args.data.urlToImage!,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  args.data.urlToImage!,
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
            ),
          ],
        ),
      ),
    );
  }
}
