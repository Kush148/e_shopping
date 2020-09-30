import 'package:e_shopping/components/app_bar.dart';
import 'package:e_shopping/components/list_tile.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  static const String id = 'MyAccScreen';
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('My Account', null),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            listTile(
                title: 'Profile',
                subtitle: 'Name, Address, Contact Details..',
                iconData: Icons.person_outline)
          ],
        ),
      ),
    );
  }
}
