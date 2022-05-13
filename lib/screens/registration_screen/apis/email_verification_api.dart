import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/registration_screen/otp_verification.dart';

Future emailVerificationApi({
  required String email,
}) async {
  var dio = Dio();
  try {
    var api = API.emailVerification;
    var params = {"email": email};
    var response = await dio.post(
      api,
      data: jsonEncode(params),
    );
    if (response.data['status'] == "success") {
      Fluttertoast.showToast(msg: response.data['message']);
      Get.to(const OTPVerification());
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
