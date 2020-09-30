import 'package:e_shopping/screens/bottom_navigation_screen.dart';
import 'package:e_shopping/screens/home_screen.dart';
import 'package:e_shopping/screens/login_screen.dart';
import 'package:e_shopping/screens/orders_screen.dart';
import 'package:e_shopping/screens/product_list_screen.dart';
import 'package:e_shopping/screens/registration_screen.dart';
import 'package:e_shopping/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        BottomNavigationScreen.id: (context) => BottomNavigationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProductListScreen.id: (context) => ProductListScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        OrdersScreen.id: (context) => OrdersScreen(),
      },
    );
  }
}
