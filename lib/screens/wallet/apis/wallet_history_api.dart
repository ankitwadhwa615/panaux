import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:ttsf_cloud/commons/api_constants.dart';
import 'package:ttsf_cloud/screens/wallet/models/transaction_details_model.dart';

Future<List<TransactionDetailsModel>> getWalletHistoryApi() async {
  var dio = Dio();
  List<TransactionDetailsModel> data = [];
  try {
		var box = await Hive.openBox('userBox');
		var token = await box.get('token');
		var options = Options(headers: {"Authorization": "Bearer " + token});
		var api = API.walletHistoryApi;
    var response = await dio.get(api,options: options);
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.data["status"] == "success") {
        for (var element in response.data["data"]) {
          var responseData = json.encode(element);
          print(responseData);
          data.add((transactionDetailsModelFromJson(responseData)));
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
  return data;
}
