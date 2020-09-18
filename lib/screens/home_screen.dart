import 'package:carousel_slider/carousel_slider.dart';
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
        //Todo: Do we have to add this in all page?
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
