import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shopping/components/app_bar.dart';
import 'package:e_shopping/components/category_list_widget.dart';
import 'package:e_shopping/components/product_list_view.dart';
import 'package:e_shopping/models/products.dart';
import 'package:e_shopping/utils/constants.dart';
import 'package:e_shopping/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Products> newProductlist = [];
List<Products> popProductlist = [];

//TODO carousel slider images,category images

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NetworkServices networkServices = NetworkServices();

  getuserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print('getUserData');
    print(preferences.getString('UserName') ?? '');
  }

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
    getuserData();
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
          mainAxisSize: MainAxisSize.min,
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
            SizedBox(
              height: 10,
            ),
            CategoryList(),
            SizedBox(
              height: 15,
            ),
            Text(
              'Popular Products',
              style: kTitleTextStyle,
            ),
            ProductListView(
              list: popProductlist,
            ),
            Text(
              'New Products',
              style: kTitleTextStyle,
            ),
            ProductListView(
              list: newProductlist,
            ),
          ],
        ),
      ),
    );
  }
}
