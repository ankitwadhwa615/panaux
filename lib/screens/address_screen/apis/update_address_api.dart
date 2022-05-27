import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as getx;
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panaux_customer/commons/api_constants.dart';

Future editAddressApi(
    {required String address,
    required String manualAddress,
    required String city,
    required String state,
    required String pinCode,
    required String country,
    required double lat,
    required double long,
    XFile? storeImage}) async {
  var dio = Dio();
  // SignUpResponseModel? signUpResponseModel;
  try {
    var api = API.userProfileApi;
    FormData formData;
    if (storeImage == null) {
      formData = FormData.fromMap({
        "addressLine1": address,
        "addressLine2": manualAddress,
        "city": city,
        "state": state,
        "pincode": pinCode,
        "country": country,
        "longitude": long,
        "latitude": lat,
      });
    } else {
      String storeImageName = storeImage.path.split('/').last;
      formData = FormData.fromMap({
        "addressLine1": address,
        "addressLine2": manualAddress,
        "city": city,
        "state": state,
        "pincode": pinCode,
        "country": country,
        "longitude": long,
        "latitude": lat,
        'storeImage': await MultipartFile.fromFile(storeImage.path,
            filename: storeImageName),
      });
    }
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response = await dio.patch(api, data: formData, options: options);
    if (response.data['status'] == "OK") {
      var responseData = json.encode(response.data['data']);
      var box = await Hive.openBox("userBox");
      box.put('userData', responseData);
      Fluttertoast.showToast(msg: "Updated Address Successfully");
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
