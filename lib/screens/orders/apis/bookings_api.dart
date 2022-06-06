import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import '../../../commons/api_constants.dart';
import '../models/booking_details_model.dart';

Future getBookingsApi() async {

  List<BookingModel> bookingsList = [];
  var dio = Dio();
  try {
    var api = API.getBookingsApi;
    var box = await Hive.openBox("userBox");
    String token = box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response = await dio.post(api, options: options);
    print(response.data);
    if (response.statusCode==200 || response.statusCode==201) {
      for (var each in response.data) {
        var responseData = json.encode(each);
        BookingModel bookingsDetails =bookingModelFromJson(responseData);
        if (bookingsDetails.client?.id != null && bookingsDetails.id != null) {
          bookingsList.add(bookingsDetails);
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
  return bookingsList;
}
