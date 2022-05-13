import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';

Future addDeliveredApi(
    String id) async {
  var dio = Dio();
  try {
    var api = API.updateOrder;
    var params = {
      "status": "delivered",
    };
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response =
    await dio.patch("$api$id", data: jsonEncode(params), options: options);
    if (response.data['status'] == "success") {
      Fluttertoast.showToast(msg: response.data['message']);
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
