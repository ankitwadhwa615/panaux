
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ttsf_cloud/commons/constants.dart';
import 'package:ttsf_cloud/commons/widgets/disabled_text_fields.dart';
import 'package:ttsf_cloud/screens/pharmacy/models/pharmacy_model.dart';

import 'controllers/pharmacy_controller.dart';

class PharmacyDetails extends StatefulWidget {
  final PharmacyModel data;
  const PharmacyDetails({Key? key,required this.data}) : super(key: key);

  @override
  State<PharmacyDetails> createState() => _PharmacyDetailsState();
}

class _PharmacyDetailsState extends State<PharmacyDetails> {
  final ImagePicker _picker = ImagePicker();
  PharmacyController controller = Get.put(PharmacyController());
  _imgFromGallery() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      controller.prescription = pickedFile!;
    });
    if(controller.prescription!=null){
      controller.createOrder(widget.data.id??"");
    }
  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: controller.loading.value,
      progressIndicator:  CircularProgressIndicator(
        color: primaryColor,
        backgroundColor: Colors.black12,
        strokeWidth: 1.5,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(icon: const Icon(Icons.arrow_back_sharp,color: Colors.black,),onPressed: (){Get.back();},),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(
                  height: 200,
                  child: Center(child: Image.network(widget.data.storeImage??"",fit:BoxFit.fitWidth)),
                ),
                const Text(
                  'Pharmacy Information',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 25,
                ),
                DisabledTextFields(prefixIcon: Icons.store_mall_directory, value: widget.data.storeName??""),
                const SizedBox(
                  height: 15,
                ),
                DisabledTextFields(prefixIcon: Icons.person, value: widget.data.ownerName??""),
                const SizedBox(
                  height: 15,
                ),
                 DisabledTextFields(
                    prefixIcon: Icons.phone_android, value: widget.data.number.toString()),
                const SizedBox(
                  height: 15,
                ),
                DisabledTextFields(
                    prefixIcon: Icons.email, value: widget.data.email??""),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Upload your prescription',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                MaterialButton(
                  minWidth: Get.width,
                  onPressed: () {
                    _imgFromGallery();
                  },
                  color: primaryColor,
                  child: const Text(
                    'UPLOAD VIA GALLERY',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Please upload image less than 1 mb',
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
