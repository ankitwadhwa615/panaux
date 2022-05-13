import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panaux_customer/commons/api_constants.dart';

Future privacyApi() async {
  var dio = Dio();
  String content = "";
  try {
    var api = API.privacyPolicy;
    var response = await dio.get(api);
    if (response.statusCode == 200 || response.statusCode == 201) {
       content = response.data['PrivacyPolicy']['content'].toString();
    } else {
      Fluttertoast.showToast(msg: response.data['message']);
    }
    return content;

  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    Fluttertoast.showToast(msg: "Something went wrong");
  } on SocketException {
    Fluttertoast.showToast(msg: "Please check your internet connection");
  }
}
