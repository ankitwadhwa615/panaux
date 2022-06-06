import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as Getx;
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/orders/orders_management.dart';

import '../../orders/controllers/orders_controller.dart';

Future addOrderApi({
  required XFile? prescription,
  required String vendorId,
}) async {
  var dio = Dio();
  try {
    OrdersManagementController controller=Getx.Get.put(OrdersManagementController());
    var api = API.addOrderApi;
    FormData formData;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    String prescriptionName = prescription!.path.split('/').last;
    formData = FormData.fromMap({
      "prescription": await MultipartFile.fromFile(prescription.path,
          filename: prescriptionName),
      "vendor": vendorId,
    });
    var response = await dio.post(api, data: formData, options: options);
    if (response.data['status'] == "success") {
      Getx.Get.to(const OrdersManagement());
      controller.getOrdersList();
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
