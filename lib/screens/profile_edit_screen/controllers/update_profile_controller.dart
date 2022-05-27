import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panaux_customer/screens/profile_edit_screen/models/user_profile.dart';
import '../apis/update_profile_api.dart';


class UpdateProfileController extends GetxController {
  final basicFormKey = GlobalKey<FormState>();
  RxBool loading = false.obs;
  RxBool wait = false.obs;
  RxBool updating = false.obs;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController userName = TextEditingController();
  // RxString lat = ''.obs;
  // RxString long = ''.obs;
  RxString bloodGroup = '---- Select ----'.obs;
  XFile? profileImage;
  RxString profileImageUrl = ''.obs;
  setInitials() async {
    wait.value = true;
    Box? box = await Hive.openBox('userBox');
    UserProfileModel data=userProfileModelFromJson(box.get('userData'));
    userName = TextEditingController(text: data.username.toString());
    phoneNumber = TextEditingController(text: data.number.toString());
    email = TextEditingController(text: data.email);
    profileImageUrl.value = data.profilePicture ?? "";
    bloodGroup.value=data.bloodGroup??'---- Select ----';
    wait.value = false;
  }
  updateProfile() async {
    updating.value = true;
    if(profileImage!=null){
      await editProfileApi(
        userName: userName.text,
        number: int.parse(phoneNumber.text),
        profilePicture: profileImage!,
        bloodGroup:bloodGroup.value
      );
    }else{
      await editProfileApi(
          userName: userName.text,
          number: int.parse(phoneNumber.text),
          bloodGroup:bloodGroup.value
      );
    }
    updating.value = false;
  }
  // Future getCurrentLocation() async {
  //   await Geolocator.requestPermission();
  //   try {
  //     loading.value = true;
  //     Position? position;
  //     position = await GeolocatorPlatform.instance.getCurrentPosition();
  //     lat.value = position.latitude.toString();
  //     long.value = position.longitude.toString();
  //     loading.value = false;
  //   } catch (e) {
  //     loading.value = false;
  //     Fluttertoast.showToast(msg: "Error in getting location");
  //   }
  // }
}
