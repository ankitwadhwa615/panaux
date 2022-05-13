import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:panaux_customer/commons/widgets/text_fields.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/address_screen/controllers/address_controller.dart';
import 'dart:io';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  AddressController controller = Get.put(AddressController());
  @override
  void initState() {
    controller.getData();
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            color: primaryColor,
            strokeWidth: 1.5,
          ),
          inAsyncCall: controller.asyncCall.value,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              backgroundColor: Colors.white,
            ),
            body: controller.loading.value
                ? Container()
                : SingleChildScrollView(
                    child: Form(
                      key: controller.addressFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 18, bottom: 10),
                            child: Text(
                              'Address Details',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 23),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showPicker(context);
                            },
                            child: Container(
                              width: Get.width,
                              height: Get.width * 0.55,
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
                              child: controller.storeImage != null
                                  ? Image.file(
                                      File(controller.storeImage!.path),
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                      width: 100,
                                      height: 100,
                                      child: controller.storeImageUrl.value !=
                                              ""
                                          ? Image.network(
                                              controller.storeImageUrl.value,
                                              fit: BoxFit.cover,
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.grey[800],
                                                  size: 30,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 8),
                                                  child: Text(
                                                    "Add Store Image",
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFields(
                                  controller: controller.address,
                                  title: 'Address',
                                  type: TextInputType.streetAddress,
                                  prefixIcon: Icons.location_on,
                                  hintText: '#123 CapeTown',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                              activeColor: primaryColor,
                                              value: 0,
                                              groupValue: controller
                                                  .selectedRadio.value,
                                              onChanged: (int? value) {
                                                setState(() {
                                                  controller.selectedRadio
                                                      .value = value!;
                                                });
                                              },
                                            ),
                                            const Flexible(
                                                child: Text(
                                              'Add Coordinates',
                                              overflow: TextOverflow.clip,
                                            )),
                                          ]),
                                    ),
                                    Expanded(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                                activeColor: primaryColor,
                                                value: 1,
                                                groupValue: controller
                                                    .selectedRadio.value,
                                                onChanged: (int? value) async {
                                                  setState(() {
                                                    controller.selectedRadio
                                                        .value = value!;
                                                  });
                                                  await controller
                                                      .getCurrentLocation();
                                                }),
                                            const Flexible(
                                                child: Text(
                                              'Get Location',
                                              overflow: TextOverflow.clip,
                                            )),
                                          ]),
                                    ),
                                  ],
                                ),
                                Obx(
                                  () => Visibility(
                                    visible:
                                        controller.selectedRadio.value == 1,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Latitude',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black
                                                              .withOpacity(0.4),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      controller.lat.value,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Longitude',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black
                                                            .withOpacity(0.4),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    controller.long.value,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Visibility(
                                    visible:
                                        controller.selectedRadio.value == 0,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Latitude",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                TextFormField(
                                                  initialValue:
                                                      controller.lat.value,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter Latitude';
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.text,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  cursorHeight: 20,
                                                  onChanged: (String value) {
                                                    controller.lat.value =
                                                        value;
                                                  },
                                                  cursorColor: Colors.grey[600],
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: primaryColor),
                                                    ),
                                                    focusColor: primaryColor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Longitude",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                TextFormField(
                                                  initialValue:
                                                      controller.long.value,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter Longitude';
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.text,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  cursorHeight: 20,
                                                  onChanged: (String value) {
                                                    controller.long.value =
                                                        value;
                                                  },
                                                  cursorColor: Colors.grey[600],
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: primaryColor),
                                                    ),
                                                    focusColor: primaryColor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TextFields(
                                  controller: controller.pinCode,
                                  title: 'Pin Code',
                                  type: TextInputType.number,
                                  prefixIcon: Icons.pin_drop,
                                  hintText: '500066',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFields(
                                  controller: controller.city,
                                  title: 'City',
                                  type: TextInputType.text,
                                  prefixIcon: Icons.location_city,
                                  hintText: 'Hyderabad',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFields(
                                  controller: controller.state,
                                  title: 'State',
                                  type: TextInputType.text,
                                  prefixIcon: Icons.location_city,
                                  hintText: 'Telangana',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFields(
                                  controller: controller.country,
                                  title: 'Country',
                                  type: TextInputType.text,
                                  prefixIcon: Icons.flag,
                                  hintText: 'India',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFields(
                                  hintText: '#123',
                                  controller: controller.manualAddress,
                                  title: 'Manual Address',
                                  type: TextInputType.streetAddress,
                                  prefixIcon: Icons.location_on,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            bottomNavigationBar: GestureDetector(
              onTap: () {
                controller.updateAddress();
              },
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Get.back();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Get.back();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromCamera() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    setState(() {
      controller.storeImage = pickedFile;
    });
  }

  _imgFromGallery() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      controller.storeImage = pickedFile!;
    });
  }
}
