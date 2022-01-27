import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../arguments.dart';
import '../colors.dart';
import '../flavor_config.dart';
import '../mobx/mobx_store.dart';
import '../models/articles_model.dart';
import '../routes.dart';

class ArticleCardThinLive extends StatefulWidget {
  final Articles dataModel;
  final bool onhome;

  const ArticleCardThinLive(
      {Key? key, required this.dataModel, required this.onhome})
      : super(key: key);

  @override
  _ArticleCardThinLiveState createState() => _ArticleCardThinLiveState();
}

class _ArticleCardThinLiveState extends State<ArticleCardThinLive> {
  late MobxStore store;
  String num = Random().nextInt(9999999).toString();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<MobxStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          store.incPage();
          if (widget.onhome) {
            Navigator.pushNamed(context, AppRoutes.articledetaillive,
                arguments: ArticleDetailArguments(
                    data: widget.dataModel,
                    tag: widget.dataModel.title! + num));
          } else {
            Navigator.pushReplacementNamed(context, AppRoutes.articledetaillive,
                arguments: ArticleDetailArguments(
                    data: widget.dataModel,
                    tag: widget.dataModel.title! + num));
          }
        },
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Hero(
                tag: widget.dataModel.title! + num,
                child: FlavorConfig.isDevelop()
                    ? Image.asset(widget.dataModel.urlToImage!,
                        fit: BoxFit.cover)
                    : Image.network(
                        widget.dataModel.urlToImage!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(child: Icon(Icons.error)),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
              child: Row(
                children: [
                  Expanded(
                      child: Text(widget.dataModel.publishedAt!.split('T')[0],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12)))
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(widget.dataModel.title!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle()))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(widget.dataModel.description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15, color: AppColor.grey)))
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
