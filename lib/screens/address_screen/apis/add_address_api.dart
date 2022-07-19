import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as getx;
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import '../../settings_screen/settings_screen.dart';

Future addAddressApi(
	{required String address,
		required String manualAddress,
		required String city,
		required String state,
		required int pinCode,
		required String country,
		required String lat,
		required String long,
		XFile? storeImage}) async {
	var dio = Dio();
	// FormData formData;
	// SignUpResponseModel? signUpResponseModel;
	try {
		var api = API.editAddressApi;

		var params = {
			"addressLine1": address.toString(),
				"addressLine2": manualAddress.toString(),
				"pincode": pinCode,
				"city": city.toString(),
				"state": state.toString(),
				"country": country.toString(),
				"latitude": lat.toString(),
				"longitude": long.toString(),
		};

//		if (storeImage == null) {
//
//			formData = FormData.fromMap({
//				"addressLine1": address.toString(),
//				"addressLine2": manualAddress.toString(),
//				"pincode": pinCode,
//				"city": city.toString(),
//				"state": state.toString(),
//				"country": country.toString(),
//				"latitude": lat.toString(),
//				"longitude": long.toString(),
//			});
//
//			print(formData.fields);
//		} else {
//			String storeImageName = storeImage.path.split('/').last;
//			formData = FormData.fromMap({
//				"addressLine1": address.toString(),
//				"addressLine2": manualAddress.toString(),
//				"city": city.toString(),
//				"state": state.toString(),
//				"pincode": pinCode,
//				"country": country.toString(),
//				"longitude": long.toString(),
//				"latitude": lat.toString(),
//				'storeImage': await MultipartFile.fromFile(storeImage.path,
//					filename: storeImageName),
//			});
//		}
		var box = await Hive.openBox('userBox');
		var token = await box.get('token');
		var options = Options(headers: {"Authorization": "Bearer $token"});
		var response = await dio.post(api, data: jsonEncode(params), options: options);
		if (response.statusCode ==  200 || response.statusCode == 201) {
			var responseData = json.encode(response.data['data']);
			var box = await Hive.openBox("userBox");
			box.put('userData', responseData);
			Fluttertoast.showToast(msg: "Added Address Successfully");
			getx.Get.offAll(const SettingsScreen());
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
