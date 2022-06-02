import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as GetX;
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/orders/controllers/orders_controller.dart';
import '../models/order_details_model.dart';


Future<List<OrderDetailsModel>> getOrdersApi() async {
  List<OrderDetailsModel> ordersList = [];
  var dio = Dio();
  try {
    var api = API.getOrdersApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response = await dio.get(api, options: options);
    if (response.data["status"] == "Success") {
      for (var each in response.data['userOrder']) {
        var responseData = json.encode(each);
        OrderDetailsModel orderDetails =orderDetailsModelFromJson(responseData);
        if (orderDetails.client?.id != null && orderDetails.id != null) {
          ordersList.add(orderDetails);
        }
      }
    } else {
      Fluttertoast.showToast(msg: response.data['message']);
    }
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    Fluttertoast.showToast(msg: "Something went wrong");
  } on SocketException {
    Fluttertoast.showToast(msg: "Please check your internet connection");
  }
  return ordersList;
}

Future cancelOrderApi(
    String id
    ) async {
  var dio = Dio();
  try {
    OrdersManagementController controller=GetX.Get.put(OrdersManagementController());
    var api = API.updateOrdersApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    FormData formData = FormData.fromMap({
      "id" : id,
      "status" : 'cancelled',
    });
    var response = await dio.patch(api, options: options,data: formData);
    if (response.data["status"] == "success") {
      controller.getOrdersList();
      GetX.Get.back();
      Fluttertoast.showToast(msg: 'Order Cancelled Successfully');
    } else {
      Fluttertoast.showToast(msg: response.data['message']);
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

Future paidOrderApi(
    String id,
    String mode
    ) async {
  var dio = Dio();
  try {
    OrdersManagementController controller=GetX.Get.put(OrdersManagementController());
    var api = API.updateOrdersApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    FormData formData = FormData.fromMap({
      "id" : id,
      "status" : 'paid',
      "paymentMode": mode,
    });
    var response = await dio.patch(api, options: options,data: formData);
    print(formData.fields);
    print(response.data);
    if (response.data["status"] == "success") {
      controller.getOrdersList();
      GetX.Get.back();
      Fluttertoast.showToast(msg: 'Paid Successfully');
    } else {
      Fluttertoast.showToast(msg: response.data['message']);
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