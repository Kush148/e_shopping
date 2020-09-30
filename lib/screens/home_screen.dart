import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shopping/components/app_bar.dart';
import 'package:e_shopping/components/category_list_widget.dart';
import 'package:e_shopping/components/product_list_view.dart';
import 'package:e_shopping/models/products.dart';
import 'package:e_shopping/screens/my_account_screen.dart';
import 'package:e_shopping/screens/orders_screen.dart';
import 'package:e_shopping/screens/search_screen.dart';
import 'file:///D:/AndroidStudioProjects/e_shopping/lib/utils/services.dart';
import 'package:flutter/material.dart';

List<Products> newProductlist = [];
List<Products> popProductlist = [];

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NetworkServices networkServices = NetworkServices();
  var imgList = [
    Image.asset(
      'images/eshoplogo.png',
    ),
    Image.asset(
      'images/eshoplogo.png',
    ),
    Image.asset(
      'images/eshoplogo.png',
    ),
    Image.asset(
      'images/eshoplogo.png',
    ),
  ];
  final List navigationList = [
    HomeScreen.id,
  ];

  void getPopularProducts() async {
    String response = await networkServices.getPopularProducts();
    var products = jsonDecode(response);
    List productList = products['data'];
    setState(() {
      popProductlist =
          productList.map((val) => Products.fromJson(val)).toList();
    });
  }

  void getNewProducts() async {
    String response = await networkServices.getNewProducts();
    var newProducts = jsonDecode(response);
    List productList = newProducts['data'];
    setState(() {
      newProductlist =
          productList.map((val) => Products.fromJson(val)).toList();
    });
  }

  @override
  void initState() {
    getPopularProducts();
    getNewProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('E-shopping', Icons.shopping_cart),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(
                    seconds: 2,
                  ),
                  autoPlayInterval: Duration(
                    seconds: 7,
                  ),
                ),
                items: imgList,
              ),
            ),
            CategoryList(),
            Text('Popular Products'),
            ProductListView(
              list: popProductlist,
            ),
            Text('New Products'),
            ProductListView(
              list: newProductlist,
            ),
          ],
        ),
      ),
    );
  }
}
