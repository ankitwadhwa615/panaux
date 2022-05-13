import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:panaux_customer/screens/home_screen/dashboard.dart';
import 'package:panaux_customer/screens/login/apis/login_api.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    loading.value = true;
    String status = await loginApi(
      email: email.text,
      password: password.text,
    );
    if (status == "ok") {
      loading.value = false;
      Fluttertoast.showToast(msg: 'Logged in successfully');
      Get.offAll(const DashBoard());
    } else {
      loading.value = false;
    }
    loading.value = false;
  }
}
