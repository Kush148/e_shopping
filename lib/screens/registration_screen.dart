import 'dart:convert';

import 'package:e_shopping/components/button_widget.dart';
import 'package:e_shopping/components/textfield_widget.dart';
import 'package:e_shopping/screens/login_screen.dart';
import 'file:///D:/AndroidStudioProjects/e_shopping/lib/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final NetworkServices networkServices = new NetworkServices();

  void userRegistration(
      {String name, String email, String mobileNo, String password}) async {
    String result = await networkServices.userRegistration(
        name: name, email: email, mobileNo: mobileNo, password: password);
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
        LoginScreen.id,
        //arguments: {userID, userName, userAddress},
      );
    } else {
      Fluttertoast.showToast(
          msg: "Registration Failed",
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
            hintText: 'Full Name',
            controller: fullNameController,
            icon: Icons.person,
          ),
          TextFieldWidget(
            hintText: 'E-mail',
            keyBoardType: TextInputType.emailAddress,
            controller: emailController,
            icon: Icons.alternate_email,
          ),
          TextFieldWidget(
            hintText: 'Mobile Number',
            keyBoardType: TextInputType.phone,
            controller: mobileNoController,
            icon: Icons.phone,
          ),
          TextFieldWidget(
            hintText: 'Password',
            controller: passwordController,
            isPassword: true,
            icon: Icons.lock,
          ),
          TextFieldWidget(
            hintText: 'Confirm Password',
            controller: confirmPasswordController,
            isPassword: true,
            icon: Icons.lock,
          ),
          ButtonWidget(
            buttonName: 'Registration',
            onClicked: () {
              userRegistration(
                  name: fullNameController.text,
                  email: emailController.text,
                  mobileNo: mobileNoController.text,
                  password: passwordController.text);
            },
          ),
        ],
      ),
    );
  }
}
