import 'dart:convert';

import 'package:e_shopping/models/products.dart';
import 'package:e_shopping/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'file:///D:/AndroidStudioProjects/e_shopping/lib/utils/services.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String name = 'category';
  String img;
  Function onTouch;
  final NetworkServices networkServices = NetworkServices();
  List productListByCat = [];
  List categories = [
    'category1',
    'category2',
    'category3',
    'category4',
    'category5',
    'category6',
  ];

  List categoriesImg = [
    Constants.category1Path,
    Constants.category2Path,
    Constants.category3Path,
    Constants.category4Path,
    Constants.category5Path,
    Constants.category6Path,
  ];

  @override
  void initState() {
    super.initState();
  }

  void onClick(index) async {
    print("onClick");
    String response = await networkServices.getProductsByCategory(
        category: categories[index]);
    var jsonData = jsonDecode(response);
    List productList = jsonData['data'];

    setState(() {
      productListByCat = productList.map((e) => Products.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      itemCount: 6,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.landscape) ? 2 : 3),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            onClick(index);
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    categoriesImg[index],
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                //ToDo: wrap text to fit layoutbox
                categories[index],
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
        );
      },
    );
  }
}
