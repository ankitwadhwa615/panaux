import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart' as getx;


import '../../../commons/api_constants.dart';

Future deleteAddressApi({required String id}) async {
	var dio = Dio();
	try{

		var api = API.editAddressApi;

		var box = await Hive.openBox('userBox');
		var token = await box.get('token');
		var options = Options(headers: {"Authorization": "Bearer $token"});
		var response = await dio.delete(api + '/$id',options: options);
		if(response.statusCode == 201 || response.statusCode == 200){
			var responseData = json.encode(response.data['data']);
			var box = await Hive.openBox("userBox");
			box.put('userData', responseData);
			Fluttertoast.showToast(msg: "Deleted Address Successfully");
			//getx.Get.back();
		}else{
			Fluttertoast.showToast(msg: response.data['message']);
		}

	}	on DioError catch (e) {
		if (kDebugMode) {
			print(e);
		}
		Fluttertoast.showToast(msg: "Something went wrong");
	} on SocketException {
		Fluttertoast.showToast(msg: "Please check your internet connection");
	}
}