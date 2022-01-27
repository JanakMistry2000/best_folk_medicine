import 'package:best_folk_medicine/arguments.dart';

import '../models/articles_model.dart';
import '../routes.dart';

import '../colors.dart';
import 'package:flutter/material.dart';

class ArticleCardThinLive extends StatefulWidget {
  final Articles dataModel;
  final int pageNo;
  final bool onhome;
  const ArticleCardThinLive({Key? key, required this.dataModel, required this.pageNo, required this.onhome})
      : super(key: key);

  @override
  _ArticleCardThinLiveState createState() => _ArticleCardThinLiveState();
}

class _ArticleCardThinLiveState extends State<ArticleCardThinLive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          if(widget.onhome){
            Navigator.pushNamed(context, AppRoutes.articledetaillive,
                arguments: ArticleDetailArguments(data: widget.dataModel, pageNo: widget.pageNo+1));
          }else{
            Navigator.pushReplacementNamed(context, AppRoutes.articledetaillive,
                arguments: ArticleDetailArguments(data: widget.dataModel, pageNo: widget.pageNo+1));
          }

        },
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Hero(
                tag: widget.dataModel.title! + 'thin',
                child: Image.network(
                  widget.dataModel.urlToImage!,
                  fit: BoxFit.cover,
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
