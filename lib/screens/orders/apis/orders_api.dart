import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as GetX;
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/orders/controllers/orders_controller.dart';
import '../../home_screen/dashboard.dart';
import '../models/order_details_model.dart';
import '../../../commons/models/razorpay_order_model.dart';

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
        OrderDetailsModel orderDetails =
            orderDetailsModelFromJson(responseData);
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

Future cancelOrderApi(String id) async {
  var dio = Dio();
  try {
    OrdersManagementController controller =
        GetX.Get.put(OrdersManagementController());
    var api = API.updateOrdersApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var params = {
      "id": id,
      "status": 'cancelled',
    };
    var response = await dio.patch(
      api,
      options: options,
      data: jsonEncode(params),
    );
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

Future<RazorpayOrderModel?> razorpayOrderApi(
    String id,
    ) async {
  RazorpayOrderModel? razorpayOrderModel;
  var dio = Dio();
  try {
    var api = API.updateOrdersApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var params = {
      "id": id,
      "status": 'paid',
      "paymentMode": 'paymentgateway',
    };
    print(token);
    print(api);
    print(jsonEncode(params));
    var response =
    await dio.patch(api, options: options, data: jsonEncode(params));
    if (response.data["status"] == "success") {
      var responseData = json.encode(response.data["razorpayOrder"]);
      razorpayOrderModel = razorpayOrderModelFromJson(responseData);
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
  return razorpayOrderModel;
}

Future verifyRazorpayOrderApi(
    String orderId,
    String paymentId,
    String signature
    ) async {
  var dio = Dio();
  try {
    OrdersManagementController controller=Get.put(OrdersManagementController());
    var api = API.verifyOrderPaymentApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var params = {
      "razorpay_order_id": orderId,
      "razorpay_payment_id": paymentId,
      "razorpay_signature": signature
    };
    print(api);
    print(jsonEncode(params));
    var response =
    await dio.patch(api, options: options, data: jsonEncode(params));
    if (response.data["status"] == "success") {
      Fluttertoast.showToast(msg: 'Paid Amount Successfully');
      Get.offAll(const DashBoard(index: 2,));
      controller.getOrdersList();

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
Future walletOrderApi(
    String id,
    ) async {
  var dio = Dio();
  try {
    OrdersManagementController controller=Get.put(OrdersManagementController());
    var api = API.updateOrdersApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var params = {
      "id": id,
      "status": 'paid',
      "paymentMode": 'wallet',
    };
    print(api);
    print(jsonEncode(params));
    var response =
    await dio.patch(api, options: options, data: jsonEncode(params));
    if (response.data["status"] == "success") {
      Get.offAll(const DashBoard(index: 2,));
      controller.getOrdersList();
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