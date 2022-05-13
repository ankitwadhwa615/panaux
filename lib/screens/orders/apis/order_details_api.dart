import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/orders/models/order_details_model.dart';

Future orderDetailsApi(String id) async {
  var dio = Dio();
  try {
    OrdersDetailsModel? detailsModel;
    String api = "${API.orderDetails}/$id";
    var response = await dio.get(api);
    if (response.data['status'] == "success") {
      var responseData = json.encode(response.data['order']);
      detailsModel = ordersDetailsModelFromJson(responseData);
      return detailsModel;
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    Fluttertoast.showToast(msg: "Something went wrong");
  } on SocketException {
    Fluttertoast.showToast(msg: "Please check your internet connection");
  }
}
