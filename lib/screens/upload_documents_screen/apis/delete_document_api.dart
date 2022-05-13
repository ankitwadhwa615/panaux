import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_x;
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';

Future deleteDocumentApi(
    {required String type}) async {
  var dio = Dio();
  try {
    var api = API.documentsApi;
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    FormData formData;

    if (type=='certificate') {
      formData = FormData.fromMap({
        'certificate': ''
      });
    } else {
      formData = FormData.fromMap({
        'id_proof':'',
      });
    }

    var response = await dio.post(api, options: options, data: formData);
    if (response.data['status'] == "OK") {
      Fluttertoast.showToast(msg: 'Deleted Successfully');
      get_x.Get.back();
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
