import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:ttsf_cloud/commons/api_constants.dart';
import 'package:ttsf_cloud/screens/profile_edit_screen/apis/get_profile_api.dart';

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
      var box = await Hive.openBox("userBox");
      box.put('token', response.data['token']);
      getUserProfileApi();
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
