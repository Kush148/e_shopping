import 'dart:convert';

import 'file:///D:/AndroidStudioProjects/e_shopping/lib/utils/constants.dart';
import 'package:e_shopping/models/products.dart';
import 'package:e_shopping/screens/orders_screen.dart';
import 'package:e_shopping/screens/product_list_screen.dart';
import 'file:///D:/AndroidStudioProjects/e_shopping/lib/utils/services.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  final name;
  final img;
  Function onTouch;

  CategoryList({@required this.name, @required this.img, this.onTouch});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String name;
  String img;
  Function onTouch;
  final NetworkServices networkServices = NetworkServices();
  List productListByCat = [];

  @override
  void initState() {
    name = widget.name;
    img = widget.img;
    onTouch = widget.onTouch;
    super.initState();
  }

  void onClick({@required String category}) async {
    String response = await networkServices.getNewProducts();
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.landscape) ? 2 : 3),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          onTap: onTouch,
          //ToDo : check how to retrive data from pushNamed
          //  Navigator.pushNamed(context, ProductListScreen.id, arguments: name);
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  img,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                //ToDo: wrap text to fit layoutbox
                name,
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
