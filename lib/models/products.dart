import 'package:flutter/foundation.dart';

class Products {
  var id;
  var name;
  var img;
  var category;
  var price;
  var description;
  var ratings;
  var created;
  var updated;

  factory Products.fromJson(Map<String, dynamic> data) {
    return Products(
      name: data['name'],
      img: data['img'],
    );
  }

  Products({
    this.id,
    this.name,
    this.img,
    this.category,
    this.price,
    this.description,
    this.ratings,
  });
}
