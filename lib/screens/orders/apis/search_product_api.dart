import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/orders/models/product_model.dart';

Future searchProductApi(String keyword) async {
  var dio = Dio();
  try {
    List<ProductModel> products=[];
    var api = API.searchProducts;
    var response = await dio.get("$api?keyword=$keyword");

    if (response.data['status']=="success") {
      for(var each in response.data['searchResult']){
        var responseData = json.encode(each);
        products.add(productModelFromJson(responseData));
      }
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
    if (kDebugMode) {
      print(products);
    }
    return products;
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    Fluttertoast.showToast(msg: "Something went wrong");
  } on SocketException {
    Fluttertoast.showToast(msg: "Please check your internet connection");
  }
}
