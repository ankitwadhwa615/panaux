// import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as Getx;
import 'package:image_picker/image_picker.dart';
import 'package:panaux_customer/commons/api_constants.dart';
import 'package:panaux_customer/screens/registration_screen/controllers/registration_controller.dart';
// import 'package:panaux_customer/screens/registration_screen/models/resgistration_response_model.dart';

Future register(
    {required String storeName,
    required String ownerName,
    required int number,
    // required String email,
    required String password,
    required String type,
    required String address,
    required String manualAddress,
    required String city,
    required String state,
    required String pinCode,
    required String country,
    required double lat,
    required double long,
    required String openingTime,
    required String closingTime,
    required XFile profilePicture,
    required XFile storeImage}) async {
  var dio = Dio();
  // SignUpResponseModel? signUpResponseModel;
  try {
    RegistrationController controller=Getx.Get.put(RegistrationController());
    var api = API.updateProfileApi;
    FormData formData;
    var token = controller.token;
    var options = Options(headers: {"Authorization": "Bearer " + token});
    String profilePictureName = profilePicture.path.split('/').last;
    String storeImageName = storeImage.path.split('/').last;
    formData = FormData.fromMap({
      "storeName": storeName,
      "ownerName": ownerName,
      "number": number,
      // "email": email,
      "password": password,
      "type": type,
      "openingTime": openingTime,
      "closingTime": closingTime,
      "addressLine1": address,
      "addressLine2": manualAddress,
      "city": city,
      "state": state,
      "pincode": pinCode,
      "country": country,
      "longitude": long,
      "latitude": lat,
      'profilePicture': await MultipartFile.fromFile(profilePicture.path,
          filename: profilePictureName),
      'storeImage': await MultipartFile.fromFile(storeImage.path,
          filename: storeImageName),
    });
    print(api);
    print(formData.fields);
    print(token );
    var response = await dio.patch(api, data: formData,options: options);
    if (response.data['status'] == "OK") {
      // var responseData = json.encode(response.data);
      // signUpResponseModel = signUpResponseModelFromJson(responseData);
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
