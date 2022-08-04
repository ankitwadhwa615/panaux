import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ttsf_cloud/commons/widgets/text_fields.dart';
import 'package:ttsf_cloud/commons/constants.dart';
import 'package:ttsf_cloud/screens/address_screen/controllers/address_controller.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  AddressController controller = Get.put(AddressController());

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
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.addressFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 18, bottom: 10),
                    child: Text(
                      'Enter Your Address',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 23),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFields(
                          controller: controller.addressLine1,
                          title: 'Address line 1',
                          type: TextInputType.streetAddress,
                          prefixIcon: Icons.location_on,
                          hintText: '#123 CapeTown',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFields(
                          hintText: '123',
                          controller: controller.addressLine2,
                          title: 'Address line 2',
                          type: TextInputType.streetAddress,
                          prefixIcon: Icons.location_on,
                        ),
                        const SizedBox(
                          height: 20,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SelectState(
                            style: const TextStyle(fontWeight: FontWeight.w500),
                            onCountryChanged: (value) {
                              setState(() {
                                controller.country = "India";
                              });
                            },
                            onStateChanged: (value) {
                              setState(() {
                                controller.state = value;
                              });
                            },
                            onCityChanged: (value) {
                              setState(() {
                                controller.city = value;
                              });
                            },
                          ),
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
              controller.addAddress();
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
                    'SUBMIT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
