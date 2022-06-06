import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:panaux_customer/screens/address_screen/apis/add_address_api.dart';
import '../../profile_edit_screen/models/user_profile.dart';
import '../apis/delete_address_api.dart';
import '../apis/update_address_api.dart';

class AddressController extends GetxController {
  final addressFormKey = GlobalKey<FormState>();
  TextEditingController addressLine1 = TextEditingController();
  RxInt selectedRadio = 0.obs;
  RxString lat = ''.obs;
  RxString long = ''.obs;
  String city ='';
  String state ='';
  String country = '';
  TextEditingController pinCode = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();
  RxBool loading = true.obs;
  RxBool asyncCall = false.obs;
  RxBool updating = false.obs;


  String addressId = "";

  updateAddress() async {
    updating.value = true;
      await editAddressApi(
        city: city,
        state: state,
        country: country,
        pinCode: pinCode.text,
        address: addressLine1.text,
        manualAddress: addressLine2.text,
        lat: double.parse(lat.value),
        long: double.parse(long.value),
      );
      updating.value = false;
  }

  addAddress() async {
	  asyncCall.value = true;
	  await addAddressApi(
		  address: addressLine1.text,
		  manualAddress: addressLine2.text,
		  city: city,
		  state: state,
		  pinCode: int.parse(pinCode.text.toString()),
		  country: country,
		  lat: "00000",
		  long: "00000"
	  );
  }

  deleteAddress() async {
  	asyncCall.value = true;
  	await deleteAddressApi(
	    id: addressId
    );
  	asyncCall.value = false;
  }

  List<dynamic> addresses = [];

  addressList() async {
  	asyncCall.value = true;
    Box? box = await Hive.openBox('userBox');
    UserProfileModel data = userProfileModelFromJson(box.get('userData'));
    addresses = data.addressess!;
    asyncCall.value = false;
  }


  Future getCurrentLocation() async {
    await Geolocator.requestPermission();
    try {
      asyncCall.value = true;
      Position? position;
      position = await GeolocatorPlatform.instance.getCurrentPosition();
      lat.value = position.latitude.toString();
      long.value = position.longitude.toString();
      asyncCall.value = false;
    } catch (e) {
      asyncCall.value = false;
      Fluttertoast.showToast(msg: "Error in getting location");
    }
  }
}
