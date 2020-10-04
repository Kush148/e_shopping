import 'dart:convert';
import 'package:e_shopping/models/products.dart';
import 'package:e_shopping/screens/product_list_screen.dart';
import 'package:e_shopping/utils/constants.dart';
import 'package:e_shopping/utils/services.dart';
import 'package:flutter/cupertino.dart';
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
    'Vegetables',
    'Fruits',
    'Grains',
    'Dairy',
    'Frozen',
    'Others',
  ];

  List categoriesImg = [
    categoryImg1,
    categoryImg2,
    categoryImg3,
    categoryImg4,
    categoryImg5,
    categoryImg6,
  ];

  @override
  void initState() {
    super.initState();
  }

  void onClick(index) async {
    String response = await networkServices.getProductsByCategory(
        category: categories[index]);
    var jsonData = jsonDecode(response);
    List productList = jsonData['data'];
    productListByCat = productList.map((e) => Products.fromJson(e)).toList();
    Navigator.pushNamed(
      context,
      ProductListScreen.id,
      arguments: productListByCat,
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
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
