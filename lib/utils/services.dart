import 'package:e_shopping/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

const eshoppingURL = "http://192.168.2.20/eshopping/";

class NetworkServices {
  //ToDO: 1.Can we make this methods static? 2.Item OverFlow Issue.3.order of values passed in php

  Future userLogin({String mobileNo, String password}) async {
    String loginUrl = eshoppingURL + "login.php";

    Response response =
        await post(loginUrl, body: {"mobile": mobileNo, "password": password});
    return response.body;
  }

  Future userRegistration(
      {String name, String email, String mobileNo, String password}) async {
    String registrationUrl = eshoppingURL + "registration.php";
    Response response = await post(registrationUrl, body: {
      "name": name,
      "mobile": mobileNo,
      "password": password,
      "email": email,
      "address": "123",
    });
    print(response.body);
    return response.body;
  }

  Future getPopularProducts() async {
    String popularProductsUrl = eshoppingURL + "popularProducts.php";

    Response response = await post(popularProductsUrl);
    print(response.body);
    return response.body;
  }

  Future getNewProducts() async {
    String newProductsUrl = eshoppingURL + "newProducts.php";

    Response response = await post(newProductsUrl);
    // print(response.body);

    return response.body;
  }

  Future getProductsByCategory({@required String category}) async {
    String newProductsUrl = eshoppingURL + "productsByCategory.php";

    Response response = await post(newProductsUrl, body: {
      "category": 'category1',
    });
    print(response.body);

    return response.body;
  }
}
