import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../commons/api_constants.dart';
import '../controllers/orders_controller.dart';

Future ratingsApi(String client,String order,String vendor,int rating) async {
  var dio = Dio();
  try {
    var api = API.addRating;
    OrdersManagementController controller = Get.put(OrdersManagementController());
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var params = {
      "client":client,
      "vendor":vendor,
      "order":order,
      "rating":rating
    };
    print(token);
    print(params);
    print(api);
    var response = await dio.post(
      api,
      options: options,
      data: jsonEncode(params),
    );

    print(response.data);
    if (response.statusCode==200 || response.statusCode==201) {
      controller.ratings.value=true;
      controller.getOrdersList();
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
}