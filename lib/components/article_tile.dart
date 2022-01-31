import '../colors.dart';
import '../models/article_datamodel.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatefulWidget {
  final ArticleDataModel dataModel;

  const ArticleTile({Key? key, required this.dataModel}) : super(key: key);

  @override
  _ArticleTileState createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          SizedBox(
            height: double.infinity,
            width: 120,
            child: Image.asset(
              widget.dataModel.image,
              fit: BoxFit.cover,
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
                      widget.dataModel.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(widget.dataModel.timeofupload,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(widget.dataModel.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                const TextStyle(fontSize: 15, color: AppColor.grey)))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
