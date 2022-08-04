import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ttsf_cloud/commons/api_constants.dart';
import 'package:ttsf_cloud/screens/registration_screen/controllers/registration_controller.dart';
import 'package:ttsf_cloud/screens/registration_screen/registration_screen.dart';

Future otpConfirmationApi({required String email, required String otp}) async {
  var dio = Dio();
  try {
    var api = API.emailVerification;
    var params = {"email": email, "OTP": otp};
    var response = await dio.patch(
      api,
      data: jsonEncode(params),
    );
    print(params);
    if (response.data['status'] == "success") {
      Fluttertoast.showToast(msg: 'Verified Successfully');
      RegistrationController controller = Get.put(RegistrationController());
      controller.token = response.data['token'];
      Get.offAll(const RegistrationScreen());
    } else {
      Fluttertoast.showToast(msg: 'Please enter correct OTP');
    }
    return response.data['status'];
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    Fluttertoast.showToast(msg: 'Please enter correct OTP');
  } on SocketException {
    Fluttertoast.showToast(msg: "Please check your internet connection");
  }
}
