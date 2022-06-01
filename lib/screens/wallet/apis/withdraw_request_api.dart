import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/wallet/controllers/wallet_controller.dart';

WalletController controller = Get.put(WalletController());
Future withdrawalRequestApi({
  required int amount,
}) async {
  var dio = Dio();
  try {
    var api = API.addMoneyToWallet;
    var params = {"amount": amount};
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response =
        await dio.post(api, data: jsonEncode(params), options: options);

    print(response);
    if (response.data['status'] == "success") {
     // Fluttertoast.showToast(msg: response.data['message']);
      controller.getBalance();
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
