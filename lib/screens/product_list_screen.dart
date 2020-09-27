import 'dart:convert';

import 'package:e_shopping/components/product_list_view.dart';
import 'package:e_shopping/models/products.dart';
import 'file:///D:/AndroidStudioProjects/e_shopping/lib/utils/services.dart';
import 'package:flutter/material.dart';

List newProductList = [];

class ProductListScreen extends StatefulWidget {
  static const String id = "ProductListScreen";
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  NetworkServices networkServices = NetworkServices();

  void getNewProducts() async {
    String response = await networkServices.getNewProducts();
    var newProducts = jsonDecode(response);
    List productList = newProducts['data'];
    print(productList);
    setState(() {
      newProductList =
          productList.map((val) => Products.fromJson(val)).toList();
    });
  }

  @override
  void initState() {
    getNewProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("name"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
        //Todo: Extract widget
      ),
      body: SingleChildScrollView(
        //color: Colors.red,
        child: ProductListView(
          list: newProductList,
        ),
      ),
    );
  }
}
