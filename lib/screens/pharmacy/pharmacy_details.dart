
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/commons/widgets/disabled_text_fields.dart';

class PharmacyDetails extends StatefulWidget {
  const PharmacyDetails({Key? key}) : super(key: key);

  @override
  State<PharmacyDetails> createState() => _PharmacyDetailsState();
}

class _PharmacyDetailsState extends State<PharmacyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const SizedBox(
                height: 200,
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
              const DisabledTextFields(prefixIcon: Icons.person, value: 'Ram Kumar'),
              const SizedBox(
                height: 15,
              ),
              const DisabledTextFields(
                  prefixIcon: Icons.phone_android, value: '1234567890'),
              const SizedBox(
                height: 15,
              ),
              const DisabledTextFields(
                  prefixIcon: Icons.email, value: 'rkrishna123@gmsil.com'),
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
                onPressed: () {},
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
    );
  }
}
