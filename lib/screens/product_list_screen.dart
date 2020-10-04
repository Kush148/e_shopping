import 'package:e_shopping/screens/product_details_screen.dart';
import 'package:e_shopping/utils/constants.dart';
import 'package:e_shopping/utils/services.dart';
import 'package:flutter/material.dart';

List newProductList = [];

class ProductListScreen extends StatefulWidget {
  static const String id = "ProductListScreen";
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  NetworkServices networkServices = NetworkServices();
  List rcvdData;
//Todo same method in 2 class
  void onClick(int index, var context) {
    print('onclick');
    Map productData = new Map<String, dynamic>();
    productData = {
      "id": rcvdData[index].id,
      "name": rcvdData[index].name,
      "img": rcvdData[index].img,
      "category": rcvdData[index].category,
      "price": rcvdData[index].price,
      "description": rcvdData[index].description,
      "ratings": rcvdData[index].ratings,
    };
    Navigator.pushNamed(context, ProductDetailsScreen.id,
        arguments: productData);
  }

  @override
  Widget build(BuildContext context) {
    rcvdData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text((rcvdData[0].category).toString().toUpperCase()),
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
      body: ListView.builder(
        itemCount: rcvdData.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              onClick(index, context);
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              shadowColor: Colors.grey,
              elevation: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        eshoppingURL + rcvdData[index].img,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            //ToDo: wrap text to fit layoutbox if character exceeds
                            rcvdData[index].name,
                            style: kProductNameTextStyle,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            //ToDo: wrap text to fit layoutbox if character exceeds
                            '\$ ${rcvdData[index].price}',
                            style: kPriceTextStyle,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RaisedButton(
                            onPressed: () {},
                            child: Text('Add to cart'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
