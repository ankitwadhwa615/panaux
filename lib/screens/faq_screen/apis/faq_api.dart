import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ttsf_cloud/commons/api_constants.dart';
import 'package:ttsf_cloud/screens/faq_screen/models/faq_model.dart';

Future<List<FAQModel>> faqApi() async {
  var dio = Dio();
  List<FAQModel> _allFAQ = [];
  try {
    var api = API.faq;
    var response = await dio.get(api);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var list = response.data['PrivacyPolicy'] as List;

      for (var element in list) {
        _allFAQ.add(FAQModel(
            expandedValue: element['answer'], headerValue: element['title']));
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
  return _allFAQ;
}
