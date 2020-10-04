import 'package:e_shopping/screens/product_details_screen.dart';
import 'package:e_shopping/utils/services.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  final List list;

  ProductListView({this.list});
  void onClick(int index, var context) {
    print('onclick');
    Map productData = new Map<String, dynamic>();
    productData = {
      "id": list[index].id,
      "name": list[index].name,
      "img": list[index].img,
      "category": list[index].category,
      "price": list[index].price,
      "description": list[index].description,
      "ratings": list[index].ratings,
    };
    Navigator.pushNamed(context, ProductDetailsScreen.id,
        arguments: productData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                onClick(index, context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        eshoppingURL + list[index].img,
                        width: 150,
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      list[index].name,
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
