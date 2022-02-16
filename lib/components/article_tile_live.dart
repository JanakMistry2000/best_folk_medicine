import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.articledetaillive,
              arguments:
                  ArticleDetailArguments(data: widget.dataModel, pageNo: 2));
        },
        child: Row(
          children: [
            SizedBox(
              height: double.infinity,
              width: 120,
              child: Hero(
                tag: widget.dataModel.title! + 'tile',
                child: Image.network(
                  widget.dataModel.urlToImage!,
                  fit: BoxFit.cover,
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
