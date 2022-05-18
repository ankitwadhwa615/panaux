import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';

Future updatePasswordApi({
  required String oldPassword,
  required String newPassword,
}) async {
  var dio = Dio();
  try {
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var api = API.updatePasswordApi;
    var params = {
      "newPassword": newPassword,
      "oldPassword": oldPassword,
    };
    var response =
        await dio.post(api, data: jsonEncode(params), options: options);
    if (response.data['status'] == "OK") {
      Fluttertoast.showToast(msg:response.data['message']);
      Get.back();
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
