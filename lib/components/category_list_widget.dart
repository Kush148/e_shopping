import 'file:///D:/AndroidStudioProjects/e_shopping/lib/utils/constants.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            Constants.categoryPath,
            height: 100,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          'Category 1',
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
