import 'package:e_shopping/components/app_bar.dart';
import 'package:e_shopping/utils/constants.dart';
import 'package:e_shopping/utils/services.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String id = "ProductDetailsScreen";
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Map productData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar(productData["name"], null),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(eshoppingURL + productData["img"]),
            SizedBox(
              height: 10,
            ),
            Text(
              productData["name"],
              style: kProductNameTextStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "\$ ${productData["price"]}",
              style: kPriceTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              productData['description'],
              style: kDescriptionTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
