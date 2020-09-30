import 'dart:convert';
import 'package:e_shopping/components/button_widget.dart';
import 'package:e_shopping/components/textfield_widget.dart';
import 'package:e_shopping/screens/bottom_navigation_screen.dart';
import 'package:e_shopping/screens/home_screen.dart';
import 'package:e_shopping/screens/registration_screen.dart';
import 'file:///D:/AndroidStudioProjects/e_shopping/lib/utils/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileNoController = TextEditingController();
  final passwordController = TextEditingController();
  NetworkServices networkServices = new NetworkServices();

  void checkUser({String mobileNo, String password}) async {
    final String result =
        await networkServices.userLogin(mobileNo: mobileNo, password: password);
    print(result);
    final rawData = jsonDecode(result);
    final responseCode = rawData['result'];
    final String userID = rawData['id'];
    final String userName = rawData['name'];
    final String userAddress = rawData['address'];

    if (responseCode == 200) {
      mobileNoController.clear();
      passwordController.clear();
      Navigator.pushReplacementNamed(
        context,
        HomeScreen.id,
        arguments: {userID, userName, userAddress},
      );
    } else {
      Fluttertoast.showToast(
          msg: "Login Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.asset('images/eshoplogo.png'),
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            hintText: 'Mobile Number',
            keyBoardType: TextInputType.number,
            controller: mobileNoController,
            icon: Icons.phone,
          ),
          TextFieldWidget(
            hintText: 'Password',
            controller: passwordController,
            isPassword: true,
            icon: Icons.lock,
          ),
          ButtonWidget(
            buttonName: 'Login',
            onClicked: () {
              print(mobileNoController.text);
              print(passwordController.text);
              checkUser(
                  mobileNo: mobileNoController.text,
                  password: passwordController.text);
              // Navigator.pushReplacementNamed(
              //   context,
              //   HomeScreen.id,
              // );
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RegistrationScreen.id,
              );
            },
            child: Text(
              'New User? Create an Account',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                BottomNavigationScreen.id,
              );
            },
            child: Text(
              'Skip >>',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
