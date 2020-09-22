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
}
