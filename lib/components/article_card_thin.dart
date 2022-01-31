import '../colors.dart';
import '../models/article_datamodel.dart';
import 'package:flutter/material.dart';

class ArticleCardThin extends StatefulWidget {
  final ArticleDataModel dataModel;

  const ArticleCardThin({Key? key, required this.dataModel}) : super(key: key);

  @override
  _ArticleCardThinState createState() => _ArticleCardThinState();
}

class _ArticleCardThinState extends State<ArticleCardThin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Image.asset(
              widget.dataModel.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
            child: Row(
              children: [
                Expanded(
                    child: Text(widget.dataModel.timeofupload,
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
                      child: Text(widget.dataModel.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle()))
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5),
              child: Row(
                children: [
                  Expanded(
                      child: Text(widget.dataModel.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 15, color: AppColor.grey)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
