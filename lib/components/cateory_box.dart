import 'package:best_folk_medicine/colors.dart';
import 'package:best_folk_medicine/models/category_data_model.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatefulWidget {
  final CategoryDataModel dataModel;

  const CategoryBox({Key? key, required this.dataModel}) : super(key: key);

  @override
  CategoryBoxState createState() => CategoryBoxState();
}

class CategoryBoxState extends State<CategoryBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.white,
        border: Border.all(color: AppColor.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(widget.dataModel.name,
          style: const TextStyle(), overflow: TextOverflow.ellipsis),
    );
  }
}
