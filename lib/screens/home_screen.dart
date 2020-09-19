import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shopping/components/category_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
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

  void onTabtapped(int index) {
    setState(() {
      currentIndex = index;
    });
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
      body: Column(
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
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10),
              mainAxisSpacing: 10,
              childAspectRatio: 0.9,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                CategoryList(),
                CategoryList(),
                CategoryList(),
                CategoryList(),
                CategoryList(),
                CategoryList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.lightBlueAccent,
        onTap: onTabtapped,
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
              Icons.more_vert,
            ),
            title: Text('More'),
          ),
        ],
      ),
    );
  }
}
