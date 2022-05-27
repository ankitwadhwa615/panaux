import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';


 getUserProfileApi() async {
  var dio = Dio();
  try {
    var api = API.userProfileApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response = await dio.get(api, options: options);
    if (response.data["status"]== "ok") {
      var responseData = json.encode(response.data['data']);
      box.put('userData', responseData);
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
