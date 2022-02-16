import 'package:best_folk_medicine/models/articles_model.dart';
import 'package:best_folk_medicine/utils.dart';
import '../arguments.dart';
import '../routes.dart';
import 'package:flutter/material.dart';

class ArticleCardLive extends StatefulWidget {
  final Articles dataModel;

  const ArticleCardLive(this.dataModel, {Key? key}) : super(key: key);

  @override
  ArticleCardLiveState createState() => ArticleCardLiveState();
}

class ArticleCardLiveState extends State<ArticleCardLive> {
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
          Utils.mainappnavi.currentState
              ?.pushNamed(AppRoutes.articledetaillive, arguments: ArticleDetailArguments(data: widget.dataModel, pageNo: 2));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 135,
              width: double.infinity,
              child: Hero(
                tag: widget.dataModel.title!,
                child: Image.network(
                  widget.dataModel.urlToImage!,
                  fit: BoxFit.cover,
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
