import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final bool isPassword;
  final Color backgroundColor;
  final IconData icon;

  TextFieldWidget(
      {this.icon,
      @required this.hintText,
      this.keyBoardType = TextInputType.text,
      @required this.controller,
      this.isPassword = false,
      this.backgroundColor = Colors.lightBlueAccent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: backgroundColor,
        ),
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: keyBoardType,
          obscureText: isPassword,
          controller: controller,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            icon: Padding(
              padding: EdgeInsets.only(
                left: icon == null ? 0 : 15,
              ),
              child: Icon(
                icon,
                color: Colors.black54,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            border: InputBorder.none,
            // contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }
}
