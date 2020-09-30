import 'package:flutter/material.dart';

//TODO diff between this and other components
Widget listTile({String title, String subtitle, IconData iconData}) {
  return ListTile(
    title: Text(title),
    subtitle: Text(
      subtitle,
      style: TextStyle(letterSpacing: 1, wordSpacing: 2),
    ),
    leading: Icon(iconData),
  );
}
