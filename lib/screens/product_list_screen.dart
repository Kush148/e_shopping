import 'package:e_shopping/components/product_list_view.dart';
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

  @override
  Widget build(BuildContext context) {
    final List rcvdData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("name"),
        //TODO get name from recieved data
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
          list: rcvdData,
        ),
      ),
    );
  }
}
