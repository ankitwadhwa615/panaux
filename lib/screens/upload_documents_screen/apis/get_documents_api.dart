import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/upload_documents_screen/models/documents_model.dart';

Future getDocumentApi() async {
  var dio = Dio();
  try {
    DocumentsModel documentsModel = DocumentsModel(
        certificateStatus: '',
        idProofStatus: '',
        id: '',
        vendor: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        v: 0);
    var api = API.documentsApi;
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    var response = await dio.get(api, options: options);
    if (response.statusCode == 201 || response.statusCode == 200) {
      var responseData = json.encode(response.data['document']);
      documentsModel = documentsModelFromJson(responseData);
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
    return documentsModel;
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    Fluttertoast.showToast(msg: "Something went wrong");
  } on SocketException {
    Fluttertoast.showToast(msg: "Please check your internet connection");
  }
}
