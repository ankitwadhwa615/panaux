import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panaux_customer/screens/login/models/login_model.dart';
import 'package:panaux_customer/screens/profile_edit_screen/apis/update_profile_api.dart';

class UpdateProfileController extends GetxController {
  final basicFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();
  RxString bloodGroup = '---- Select ----'.obs;
  RxBool loading = false.obs;
  RxBool wait = false.obs;
  RxBool updating = false.obs;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController storeName = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController address = TextEditingController();
  RxString lat = ''.obs;
  RxString long = ''.obs;
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController manualAddress = TextEditingController();
  TextEditingController openingTime = TextEditingController();
  TextEditingController closingTime = TextEditingController();
  RxInt selectedRadio = 0.obs;
  XFile? profileImage;
  RxString profileImageUrl = ''.obs;
  RxString storeImageUrl = ''.obs;
  XFile? storeImage;
  setInitials() async {
    wait.value = true;
    Box? box = await Hive.openBox('userBox');
    LoginModel data = loginModelFromJson(box.get('userData'));
    phoneNumber = TextEditingController(text: data.number.toString());
    email = TextEditingController(text: data.email);
    storeName = TextEditingController(text: data.storeName);
    ownerName = TextEditingController(text: data.ownerName);
    address = TextEditingController(text: data.address?.addressLine1);
    lat.value = data.address==null?"":data.address!.latitude!;
    long.value = data.address==null?"":data.address!.longitude!;
    profileImageUrl.value = data.profilePicture;
    storeImageUrl.value = data.storeImage;
    city = TextEditingController(text: data.address?.city);
    state = TextEditingController(text: data.address?.state);
    country = TextEditingController(text: data.address?.country);
    pinCode = TextEditingController(text: data.address?.pincode.toString());
    manualAddress = TextEditingController(text: data.address?.addressLine2);
    openingTime = TextEditingController(text: data.openingTime);
    closingTime = TextEditingController(text: data.closingTime);
    wait.value = false;
  }

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

  updateProfile() async {
    updating.value = true;
    if(storeImage!=null && profileImage!=null){
        await editProfileApi(
        storeName: storeName.text,
        ownerName: ownerName.text,
        number: int.parse(phoneNumber.text),
        email: email.text,
        city: city.text,
        state: state.text,
        country: country.text,
        pinCode: pinCode.text,
        address: address.text,
        manualAddress: manualAddress.text,
        lat: double.parse(lat.value),
        long: double.parse(long.value),
        profilePicture: profileImage!,
        storeImage: storeImage!,
        openingTime: openingTime.text,
        closingTime: closingTime.text,
      );
    }else if(storeImage!=null && profileImage==null){

      await editProfileApi(
        storeName: storeName.text,
        ownerName: ownerName.text,
        number: int.parse(phoneNumber.text),
        email: email.text,
        city: city.text,
        state: state.text,
        country: country.text,
        pinCode: pinCode.text,
        address: address.text,
        manualAddress: manualAddress.text,
        lat: double.parse(lat.value),
        long: double.parse(long.value),
        storeImage: storeImage!,
        openingTime: openingTime.text,
        closingTime: closingTime.text,
      );
    }else if(storeImage==null && profileImage!=null){
      await editProfileApi(
        storeName: storeName.text,
        ownerName: ownerName.text,
        number: int.parse(phoneNumber.text),
        email: email.text,
        city: city.text,
        state: state.text,
        country: country.text,
        pinCode: pinCode.text,
        address: address.text,
        manualAddress: manualAddress.text,
        lat: double.parse(lat.value),
        long: double.parse(long.value),
        profilePicture: profileImage!,
        openingTime: openingTime.text,
        closingTime: closingTime.text,
      );
    }else{
      await editProfileApi(
        storeName: storeName.text,
        ownerName: ownerName.text,
        number: int.parse(phoneNumber.text),
        email: email.text,
        city: city.text,
        state: state.text,
        country: country.text,
        pinCode: pinCode.text,
        address: address.text,
        manualAddress: manualAddress.text,
        lat: double.parse(lat.value),
        long: double.parse(long.value),
        openingTime: openingTime.text,
        closingTime: closingTime.text,
      );
    }
      updating.value = false;
  }
}
