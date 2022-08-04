import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttsf_cloud/screens/forgot_password/apis/forget_password_api.dart';

class ForgotPasswordController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController email = TextEditingController();

  forgetPassword() async {
    loading.value = true;
    await forgetPasswordApi(email.text);
    loading.value = false;
  }
}
