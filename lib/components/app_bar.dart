import 'package:flutter/material.dart';

Widget appBar(String title, IconData iconData) {
  return AppBar(
    title: Text(title),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(iconData),
      ),
    ],
  );
}
