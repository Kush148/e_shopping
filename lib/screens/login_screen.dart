import 'package:e_shopping/components/button_widget.dart';
import 'package:e_shopping/components/textfield_widget.dart';
import 'package:e_shopping/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileNoController = TextEditingController();
  final passwordController = TextEditingController();

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
              Navigator.pushNamed(
                context,
                HomeScreen.id,
              );
            },
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'New User? Create Account',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {},
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
