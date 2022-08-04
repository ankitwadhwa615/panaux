import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:ttsf_cloud/commons/api_constants.dart';
import '../models/pharmacy_model.dart';


Future<List<PharmacyModel>> getPharmacyApi() async {
  List<PharmacyModel> pharmacyList = [];
  var dio = Dio();
  try {
    var api = API.pharmacyApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response = await dio.get(api, options: options);
    if (response.data["status"] == "OK") {
      for (var each in response.data['data']) {
        var responseData = json.encode(each);
        PharmacyModel doctorModel =pharmacyModelFromJson(responseData);
        if (doctorModel.storeName != null && doctorModel.id != null) {
          pharmacyList.add(doctorModel);
        }
      }
    } else {
      Fluttertoast.showToast(msg: response.data['message']);
    }
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    Fluttertoast.showToast(msg: "Something went wrong");
  } on SocketException {
    Fluttertoast.showToast(msg: "Please check your internet connection");
  }
  return pharmacyList;
}
