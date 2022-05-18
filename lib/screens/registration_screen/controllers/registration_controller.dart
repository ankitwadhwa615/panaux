import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/login/login_screen.dart';
import 'package:panaux_customer/screens/registration_screen/apis/email_verification_api.dart';
import 'package:panaux_customer/screens/registration_screen/apis/otp_confirmation_api.dart';
import 'package:panaux_customer/screens/registration_screen/apis/registration_api.dart';

class RegistrationController extends GetxController {
  String token='';
  RxBool loading = false.obs;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController userName = TextEditingController();

  TextEditingController address = TextEditingController();
  RxString lat = ''.obs;
  RxString long = ''.obs;
  RxString bloodGroup = '---- Select ----'.obs;
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController manualAddress = TextEditingController();
  TextEditingController openingTime = TextEditingController();
  TextEditingController closingTime = TextEditingController();
  TextEditingController wallet = TextEditingController();
  RxInt selectedRadio = 0.obs;
  XFile? profileImage;
  XFile? storeImage;
  String otp='';
  Future getCurrentLocation() async {
    await Geolocator.requestPermission();
    try {
      loading.value = true;
      Position? position;
      position = await GeolocatorPlatform.instance.getCurrentPosition(
          locationSettings:
              const LocationSettings(accuracy: LocationAccuracy.high));
      lat.value = position.latitude.toString();
      long.value = position.longitude.toString();
      loading.value = false;
    } catch (e) {
      loading.value = false;
      Fluttertoast.showToast(msg: "Error in getting location");
    }
  }

  signUp() async {
    loading.value = true;
    String status = await register(
      userName: userName.text,
      number: int.parse(phoneNumber.text),
      password: password.text,
    );
    if (status == "ok") {
      loading.value = false;
      Get.dialog(
        AlertDialog(
          title: Text(
            'Success',
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          ),
          content: const Text('Your information is registered successfully'),
          actions: [
            InkWell(
              onTap: () {
                Get.offAll(const LoginScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 16,
                ),
                child: const Text(
                  'LOGIN AGAIN',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      loading.value = false;
    }
    loading.value = false;
  }
  verifyEmail() async {
    loading.value = true;
    await emailVerificationApi(
     email: email.text
    );
    loading.value = false;
  }
  confirmOtp() async {
    loading.value = true;
    await otpConfirmationApi(
        email: email.text, otp: otp
    );
    loading.value = false;
  }
}
