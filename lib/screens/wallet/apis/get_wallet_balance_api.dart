import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/wallet/models/wallet_balance_model.dart';

Future<WalletBalanceModel> getWalletBalanceApi() async {
  var dio = Dio();
  WalletBalanceModel data = WalletBalanceModel(totalBalance: 0, availableBalance: 0);
  try {
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var api = API.walletBalanceApi;
    var response = await dio.get(api,options: options);
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.data["status"] == 'success') {
        return walletBalanceModelFromJson(json.encode(response.data['data']));
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
