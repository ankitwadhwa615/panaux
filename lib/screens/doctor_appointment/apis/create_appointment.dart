import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import '../../../commons/models/razorpay_order_model.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/screens/home_screen/dashboard.dart';

import '../../orders/controllers/orders_controller.dart';

Future<RazorpayOrderModel?> createAppointmentApi({
  required String docId,
  required String description,
  required String title,
  required String appointmentTime,
  required String appointmentMode,
  required int appointmentFees,
}) async {
  var dio = Dio();
  RazorpayOrderModel? razorpayOrderModel;
  try {
    var api = API.bookingApi;
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var params = {
      "doctor": docId,
      "description": description,
      "title": title,
      "paymentType": 'paymentgateway',
      "appointmentTime": appointmentTime,
      "appointmentMode": appointmentMode,
      "appointmentFees": appointmentFees
    };

    var response =
        await dio.post(api, data: jsonEncode(params), options: options);
    print(response.data);
    if (response.data['status'] == "success") {
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
Future verifyRazorpayAppointmentApi(
    String orderId,
    String paymentId,
    String signature
    ) async {
  var dio = Dio();
  try {
    OrdersManagementController controller=Get.put(OrdersManagementController());
    var api = API.verifyAppointmentPaymentApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var params = {
      "razorpay_order_id": orderId,
      "razorpay_payment_id": paymentId,
      "razorpay_signature": signature
    };
    
    var response =
    await dio.patch(api, options: options, data: jsonEncode(params));
    if (response.data["status"] == "success") {
      Get.offAll(const DashBoard(index: 2,));
      controller.getBookingsList();
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

