import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../apis/update_password_api.dart';

class UpdatePasswordController extends GetxController {
  TextEditingController newPassword = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  RxBool loading = false.obs;
  updatePassword() async {
    loading.value = true;
    await updatePasswordApi(
        newPassword: newPassword.text, oldPassword: oldPassword.text);
    loading.value = false;
  }
}
