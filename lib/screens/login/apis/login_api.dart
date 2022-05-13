import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';

Future loginApi({
  required String email,
  required String password,
}) async {
  var dio = Dio();
  try {
    var api = API.login;
    var params = {"email": email, "password": password};
    var response = await dio.post(
      api,
      data: jsonEncode(params),
    );
    if (response.data['status'] == "ok") {
      var responseData = json.encode(response.data['data']);
      var box = await Hive.openBox("userBox");
      box.put('userData', responseData);
      box.put('token', response.data['token']);
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
