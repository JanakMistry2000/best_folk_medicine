import 'dart:math';

import 'package:best_folk_medicine/flavor_config.dart';
import 'package:best_folk_medicine/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../arguments.dart';
import '../mobx/mobx_store.dart';
import '../models/articles_model.dart';
import '../routes.dart';

class ArticleCardLive extends StatefulWidget {
  final Articles dataModel;

  const ArticleCardLive(this.dataModel, {Key? key}) : super(key: key);

  @override
  ArticleCardLiveState createState() => ArticleCardLiveState();
}

class ArticleCardLiveState extends State<ArticleCardLive> {
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
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      height: 260,
      width: 280,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              spreadRadius: 0.5,
              blurRadius: 15,
              offset: Offset(0, 5))
        ],
      ),
      child: GestureDetector(
        onTap: () {
          store.setPage(2);
          Utils.mainappnavi.currentState?.pushNamed(AppRoutes.articledetaillive,
              arguments: ArticleDetailArguments(
                  data: widget.dataModel, tag: widget.dataModel.title! + num));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 135,
              width: double.infinity,
              child: Hero(
                tag: widget.dataModel.title! + num,
                child: FlavorConfig.isDevelop()
                    ? Image.asset(
                        widget.dataModel.urlToImage!,
                        fit: BoxFit.cover,
                      )
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
              padding: const EdgeInsets.fromLTRB(15.0, 15, 15.0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(widget.dataModel.source!['name']!)),
                  Text(widget.dataModel.publishedAt!.split('T')[0]),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 10),
                child: ClipRect(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.dataModel.title!,
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
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
