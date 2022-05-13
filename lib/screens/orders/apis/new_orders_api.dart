import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/orders/models/orders_model.dart';

Future newOrdersApi() async {
  var dio = Dio();
  try {
    List<OrdersModel> newOrders=[];
    var api = API.newOrders;
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response = await dio.get(api, options: options);
    if (response.data['status']=="success") {
      for(var each in response.data['data']){
        var responseData = json.encode(each);
        newOrders.add(ordersModelFromJson(responseData));
      }
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
    return newOrders;
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    Fluttertoast.showToast(msg: "Something went wrong");
  } on SocketException {
    Fluttertoast.showToast(msg: "Please check your internet connection");
  }
}
