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
      id: data['id'],
      name: data['name'],
      img: data['img'],
      category: data['category'],
      price: data['price'],
      description: data['description'],
      ratings: data['ratings'],
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
