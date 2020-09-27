import 'file:///D:/AndroidStudioProjects/e_shopping/lib/utils/services.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  List list = [];
  ProductListView({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    eshoppingURL + list[index].img,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 3,
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
          );
        });
  }
}
