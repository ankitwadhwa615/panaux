import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:ttsf_cloud/commons/api_constants.dart';
import '../models/prescription_model.dart';


Future<List<PrescriptionModel>> getPrescriptionApi() async {
  List<PrescriptionModel> prescriptionList = [];
  var dio = Dio();
  try {
    var api = API.getPrescriptions;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response = await dio.get(api, options: options);
    if (response.statusCode==201 || response.statusCode==200) {
      for (var each in response.data) {
        var responseData = json.encode(each);
        PrescriptionModel prescription =prescriptionModelFromJson(responseData);
        if (prescription.id != null) {
          prescriptionList.add(prescription);
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
  return prescriptionList;
}