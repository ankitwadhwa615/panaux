import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/home_screen/dashboard.dart';
import '../../orders/controllers/orders_controller.dart';

Future createAppointmentApi({
  required String docId,
  required String description,
  required String title,
  required String paymentType,
  required String appointmentTime,
  required String appointmentMode,
  required int appointmentFees,
}) async {
  var dio = Dio();
  try {
    OrdersManagementController controller=Get.put(OrdersManagementController());
    var api = API.bookingApi;
    // FormData formData;
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    // formData = FormData.fromMap({
    //   "doctor": docId,
    //   "description":description,
    //   "title": title,
    //   "paymentType" :paymentType,
    //   "appointmentTime": appointmentTime,
    //   "appointmentMode": appointmentMode,
    //   "appointmentFees": appointmentFees
    // });
    // print(formData.fields);
    var params = {
      "doctor": docId,
      "description": description,
      "title": title,
      "paymentType": paymentType,
      "appointmentTime": appointmentTime,
      "appointmentMode": appointmentMode,
      "appointmentFees": appointmentFees
    };

    var response =
        await dio.post(api, data: jsonEncode(params), options: options);
    print(response.data);
    if (response.data['status'] == "success") {
      Get.offAll(const DashBoard(index:2));
      controller.getBookingsList();
    } else {
      Fluttertoast.showToast(msg: response.data['message']);
    }
    return response.data['status'];
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    Fluttertoast.showToast(msg: "Something went wrong");
  } on SocketException {
    Fluttertoast.showToast(msg: "Please check your internet connection");
  }
}
