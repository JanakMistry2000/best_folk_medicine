import '../routes.dart';

import '../models/article_datamodel.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatefulWidget {
  final ArticleDataModel dataModel;

  const ArticleCard(this.dataModel, {Key? key}) : super(key: key);

  @override
  ArticleCardState createState() => ArticleCardState();
}

class ArticleCardState extends State<ArticleCard> {
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
          Navigator.pushNamed(context, AppRoutes.articledetail,
              arguments: widget.dataModel);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 135,
              width: double.infinity,
              child: Hero(
                tag: widget.dataModel.id,
                child: Image.asset(
                  widget.dataModel.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15, 15.0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.dataModel.category),
                  Text(widget.dataModel.timeofupload),
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
                          widget.dataModel.title,
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
