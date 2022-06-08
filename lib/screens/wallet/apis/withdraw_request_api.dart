import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/wallet/controllers/wallet_controller.dart';
import '../../../commons/models/razorpay_order_model.dart';

WalletController controller = Get.put(WalletController());
Future<RazorpayOrderModel?> withdrawalRequestApi({
  required int amount,
}) async {
  RazorpayOrderModel? razorpayOrderModel;
  var dio = Dio();
  try {
    var api = API.addMoneyToWallet;
    var params = {"amount": amount};
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response =
        await dio.post(api, data: jsonEncode(params), options: options);

    if (response.data['status'] == "success") {
      var responseData = json.encode(response.data["razorpayOrder"]);
      razorpayOrderModel = razorpayOrderModelFromJson(responseData);
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
  return razorpayOrderModel;
}
Future verifyRazorpayTransactionApi(
    String orderId,
    String paymentId,
    String signature
    ) async {
  var dio = Dio();
  try {
    var api = API.addMoneyToWallet;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var params = {
      "razorpay_order_id": orderId,
      "razorpay_payment_id": paymentId,
      "razorpay_signature": signature
    };

    var response =
    await dio.patch(api, options: options, data: jsonEncode(params));
    if (response.data["status"] == "success") {
      Fluttertoast.showToast(msg: 'Added Money Successfully');
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

