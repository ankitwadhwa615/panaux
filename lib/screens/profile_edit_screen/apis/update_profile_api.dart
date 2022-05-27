import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as getx;
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panaux_customer/commons/api_constants.dart';

Future editProfileApi(
    {required String userName,
    required int number,
    XFile? profilePicture,
    required String bloodGroup}) async {
  var dio = Dio();
  try {
    var api = API.userProfileApi;
    FormData formData;
    if (profilePicture == null ) {
      formData = FormData.fromMap({
        "username":userName,
        "number":number,
        "blood_group":bloodGroup
      });
    } else {
      String profilePictureName = profilePicture.path.split('/').last;
      formData = FormData.fromMap({
        "username":userName,
        "number":number,
        "blood_group":bloodGroup,
        'profilePicture': await MultipartFile.fromFile(profilePicture.path,
            filename: profilePictureName),
      });
    }
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response = await dio.patch(api, data: formData, options: options);
    if (response.data["status"]== "ok") {
      var responseData = json.encode(response.data['data']);
      var box = await Hive.openBox("userBox");
      box.put('userData', responseData);
      Fluttertoast.showToast(msg: "updated Profile Successfully");
      getx.Get.back();
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
