// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_x;
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panaux_customer/commons/api_constants.dart';

Future uploadDocumentApi(
    {required XFile idProofFile, required XFile certificateFile}) async {
  var dio = Dio();
  try {
    var api = API.documentsApi;
    var box = await Hive.openBox('userBox');
    var token = await box.get('token');
    var options = Options(headers: {"Authorization": "Bearer " + token});
    FormData formData;

    if (idProofFile.path=='') {
      String certificate = certificateFile.path.split('/').last;
      formData = FormData.fromMap({
        'certificate': await MultipartFile.fromFile(certificateFile.path,
            filename: certificate),
      });
    } else if (certificateFile.path=='') {
      String idProof = idProofFile.path.split('/').last;
      formData = FormData.fromMap({
        'id_proof':
            await MultipartFile.fromFile(idProofFile.path, filename: idProof),
      });
    } else {
      String certificate = certificateFile.path.split('/').last;
      String idProof = idProofFile.path.split('/').last;
      formData = FormData.fromMap({
        'id_proof':
            await MultipartFile.fromFile(idProofFile.path, filename: idProof),
        'certificate': await MultipartFile.fromFile(certificateFile.path,
            filename: certificate),
      });
    }

    var response = await dio.post(api, options: options, data: formData);
    if (response.data['status'] == "OK") {
      Fluttertoast.showToast(msg: 'Uploaded Successfully');
      get_x.Get.back();
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
