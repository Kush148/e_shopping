import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shopping/components/category_list_widget.dart';
import 'package:e_shopping/components/product_list_view.dart';
import 'package:e_shopping/models/products.dart';
import 'package:e_shopping/screens/product_list_screen.dart';
import 'file:///D:/AndroidStudioProjects/e_shopping/lib/utils/services.dart';
import 'package:e_shopping/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Products> newProductlist = [];
List<Products> popProductlist = [];

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
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

  void onTabTapped(int index) {
    networkServices.getProductsByCategory(category: 'category1');
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
    });
  }

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
    networkServices.getProductsByCategory(category: 'category1');
    getPopularProducts();
    getNewProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Shopping'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
        //Todo: Extract widget
      ),
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
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(10),
              mainAxisSpacing: 10,
              childAspectRatio: 0.9,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                CategoryList(
                  name: 'Smart Phones',
                  img: Constants.category1Path,
                  onTouch: () {},
                ),
              ],
            ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.lightBlueAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt,
            ),
            title: Text('Orders'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            title: Text('Account'),
          ),
        ],
        onTap: onTabTapped,
      ),
    );
  }
}
