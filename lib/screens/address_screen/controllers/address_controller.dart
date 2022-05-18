import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../apis/update_address_api.dart';

class AddressController extends GetxController {
  final addressFormKey = GlobalKey<FormState>();
  TextEditingController address = TextEditingController();
  RxInt selectedRadio = 0.obs;
  RxString lat = ''.obs;
  RxString long = ''.obs;
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController manualAddress = TextEditingController();
  RxBool loading = true.obs;
  RxBool asyncCall = false.obs;
  // LoginModel? data;
  RxString storeImageUrl = ''.obs;
  XFile? storeImage;
  // getData() async {
  //   Box? box = await Hive.openBox('userBox');
  //   // data = loginModelFromJson(box.get('userData'));
  //   address = TextEditingController(text: data!.address?.addressLine1);
  //   lat.value = data!.address!.latitude!;
  //   long.value = data!.address!.longitude!;
  //   storeImageUrl.value = data!.storeImage;
  //   city = TextEditingController(text: data!.address?.city);
  //   state = TextEditingController(text: data!.address?.state);
  //   country = TextEditingController(text: data!.address?.country);
  //   pinCode = TextEditingController(text: data!.address?.pincode.toString());
  //   manualAddress = TextEditingController(text: data!.address?.addressLine2);
  //   loading.value = false;
  // }

  updateAddress() async {
    asyncCall.value = true;
    if (storeImage != null) {
      await editAddressApi(
        city: city.text,
        state: state.text,
        country: country.text,
        pinCode: pinCode.text,
        address: address.text,
        manualAddress: manualAddress.text,
        lat: double.parse(lat.value),
        long: double.parse(long.value),
        storeImage: storeImage!,
      );
    } else {
      await editAddressApi(
        city: city.text,
        state: state.text,
        country: country.text,
        pinCode: pinCode.text,
        address: address.text,
        manualAddress: manualAddress.text,
        lat: double.parse(lat.value),
        long: double.parse(long.value),
      );
      asyncCall.value = false;
    }
  }

  Future getCurrentLocation() async {
    await Geolocator.requestPermission();
    try {
      asyncCall.value = true;
      Position? position;
      position = await GeolocatorPlatform.instance.getCurrentPosition(
          locationSettings:
              const LocationSettings(accuracy: LocationAccuracy.high));
      lat.value = position.latitude.toString();
      long.value = position.longitude.toString();
      asyncCall.value = false;
    } catch (e) {
      asyncCall.value = false;
      Fluttertoast.showToast(msg: "Error in getting location");
    }
  }
}
