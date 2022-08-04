import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as Getx;
import 'package:ttsf_cloud/commons/api_constants.dart';
import 'package:ttsf_cloud/screens/registration_screen/controllers/registration_controller.dart';

Future register(
    {
    required String userName,
    required int number,
    required String password,
      required String bloodGroup
   }) async {
  var dio = Dio();
  try {
    RegistrationController controller=Getx.Get.put(RegistrationController());
    var api = API.userProfileApi;
    FormData formData;
    var token = controller.token;
    var options = Options(headers: {"Authorization": "Bearer " + token});
    formData = FormData.fromMap({
      "username" : userName,
      "number" : number,
      "blood_group":bloodGroup,
      "password" : password
    });
    var response = await dio.patch(api, data: formData,options: options);
    if (response.data['status'] == "ok") {
      // var responseData = json.encode(response.data);
      // signUpResponseModel = signUpResponseModelFromJson(responseData);
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
