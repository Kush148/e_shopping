import 'package:e_shopping/components/button_widget.dart';
import 'package:e_shopping/components/textfield_widget.dart';
import 'package:e_shopping/screens/home_screen.dart';
import 'package:flutter/material.dart';

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
              Navigator.pushReplacementNamed(
                context,
                HomeScreen.id,
              );
            },
          ),
        ],
      ),
    );
  }
}
