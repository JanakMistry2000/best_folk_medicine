import 'dart:math';

import 'package:best_folk_medicine/flavor_config.dart';
import 'package:best_folk_medicine/mobx/mobx_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../arguments.dart';
import '../colors.dart';
import '../models/articles_model.dart';
import '../routes.dart';

class ArticleTileLive extends StatefulWidget {
  final Articles dataModel;

  const ArticleTileLive({Key? key, required this.dataModel}) : super(key: key);

  @override
  _ArticleTileLiveState createState() => _ArticleTileLiveState();
}

class _ArticleTileLiveState extends State<ArticleTileLive> {
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
      height: 130,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          store.setPage(2);
          Navigator.pushNamed(context, AppRoutes.articledetaillive,
              arguments: ArticleDetailArguments(
                  data: widget.dataModel, tag: widget.dataModel.title! + num));
        },
        child: Row(
          children: [
            SizedBox(
              height: double.infinity,
              width: 120,
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
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        widget.dataModel.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                              widget.dataModel.publishedAt!.split('T')[0],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12)))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(widget.dataModel.description!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15, color: AppColor.grey)))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
