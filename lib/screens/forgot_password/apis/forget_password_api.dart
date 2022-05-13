import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panaux_customer/commons/api_constants.dart';

Future<bool> forgetPasswordApi(String email) async {
  var dio = Dio();
  try {
    var api = API.forgetPassword;
    var response = await dio.post(api);
    if (response.data['status']=="success") {
      Fluttertoast.showToast(msg: response.data['message']);
      return true;
    } else {
      Fluttertoast.showToast(msg: response.data['message']);
      return false;
    }
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    Fluttertoast.showToast(msg: "Something went wrong");
    return false;
  } on SocketException {
    Fluttertoast.showToast(msg: "Please check your internet connection");
    return false;
  }
}
