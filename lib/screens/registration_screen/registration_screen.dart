import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttsf_cloud/commons/constants.dart';
import 'package:ttsf_cloud/commons/widgets/text_fields.dart';
import 'package:ttsf_cloud/screens/registration_screen/controllers/registration_controller.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationController controller = Get.put(RegistrationController());
  final _personalFormKey = GlobalKey<FormState>();
  List<String> bloodGroup = [
    '---- Select ----',
    'A+',
    'A-',
    'B+',
    "B-",
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: personalDetails(),
          ),
          Obx(
            () => Visibility(
              visible: controller.loading.value,
              child: Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                  backgroundColor: Colors.black12,
                  strokeWidth: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget personalDetails() {
    return SingleChildScrollView(
      child: Form(
        key: _personalFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 18, top: 40, bottom: 40),
              child: Text(
                'Register',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 23),
              ),
            ),
            // Center(
            //   child: SizedBox(
            //       height: 100,
            //       child: Image.asset('assets/images/blue_logo.png')),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFields(
                    hintText: '+91xxxxxxxxxx',
                    controller: controller.phoneNumber,
                    title: 'Phone Number',
                    type: TextInputType.phone,
                    prefixIcon: Icons.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFields(
                    controller: controller.userName,
                    title: 'User Name',
                    type: TextInputType.name,
                    prefixIcon: Icons.person,
                    hintText: 'John',
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFields(
                    hintText: "*******",
                    controller: controller.password,
                    title: 'Password',
                    type: TextInputType.text,
                    prefixIcon: Icons.vpn_key,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFields(
                    hintText: "*******",
                    controller: controller.confirmPassword,
                    title: 'Confirm Password',
                    type: TextInputType.text,
                    prefixIcon: Icons.vpn_key,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Blood Group',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButtonFormField<String>(
                      value: controller.bloodGroup.value,
                      icon: const Icon(Icons.arrow_drop_down),
                      isExpanded: true,
                      validator: (value) =>
                      value == bloodGroup.first ? '---- Select ----' : null,
                      onChanged: (String? newValue) {
                        setState(() {
                          controller.bloodGroup.value = newValue!;
                        });
                      },
                      items: bloodGroup
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_personalFormKey.currentState!.validate()) {
                          controller.signUp();
                      }
                    },
                    child: Container(
                      height: 40,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(3)),
                      child: const Center(
                        child: Text(
                          'Register Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
