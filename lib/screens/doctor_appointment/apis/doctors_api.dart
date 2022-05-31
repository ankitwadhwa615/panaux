import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import '../models/doctor_model.dart';

Future<List<DoctorModel>> getDoctorsApi() async {
  List<DoctorModel> doctorsList = [];
  var dio = Dio();
  try {
    var api = API.doctorsApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response = await dio.get(api, options: options);
    if (response.data["status"] == "OK") {
      for (var each in response.data['data']) {
        var responseData = json.encode(each);
        DoctorModel doctorModel = doctorModelFromJson(responseData);
        if (doctorModel.name != null && doctorModel.id != null) {
          doctorsList.add(doctorModel);
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
  return doctorsList;
}
