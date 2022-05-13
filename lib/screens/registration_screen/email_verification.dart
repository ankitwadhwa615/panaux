import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/commons/widgets/text_fields.dart';
import 'controllers/registration_controller.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  RegistrationController controller = Get.put(RegistrationController(),permanent: true);
  final _emailFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(()
      => ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: primaryColor,
          backgroundColor: Colors.black12,
          strokeWidth: 1.5,
        ),
        inAsyncCall: controller.loading.value,
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          // ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 50, bottom: 20),
                    child: Text(
                      'Email Verification',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),
                  ),
                  Form(
                    key: _emailFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        SizedBox(
                          height: Get.height * 0.17,
                          child: Image.asset("assets/images/panaux-logo.png"),
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        const Text('Please enter your email address'),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFields(
                            hintText: 'john@gmail.com',
                            controller: controller.email,
                            title: '',
                            type: TextInputType.emailAddress,
                            prefixIcon: Icons.email,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: GestureDetector(
                            onTap: () {
                              if (_emailFormKey.currentState!.validate()) {
                                controller.verifyEmail();
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
                                  'Get OTP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?  ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(
                                  'LOGIN HERE',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
