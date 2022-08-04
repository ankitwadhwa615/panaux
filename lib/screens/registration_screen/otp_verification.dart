import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:otp_text_field/style.dart';
import 'package:ttsf_cloud/commons/constants.dart';
import 'controllers/registration_controller.dart';
import 'package:otp_text_field/otp_text_field.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  RegistrationController controller = Get.put(RegistrationController());
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
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
                      'OTP Verification',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 23),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      // SizedBox(
                      //   height: Get.height * 0.15,
                      //   child: Image.asset("assets/images/otp_image.png"),
                      // ),
                      const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          'Enter 4 digit verification code sent to your email id',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OTPTextField(
                            controller: otpController,
                            length: 4,
                            width: Get.width,
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldWidth: 45,
                            fieldStyle: FieldStyle.box,
                            otpFieldStyle: OtpFieldStyle(
                                backgroundColor: Colors.black.withOpacity(0.05),
                                focusBorderColor: primaryColor),
                            outlineBorderRadius: 10,
                            style: TextStyle(fontSize: 15, color: primaryColor),
                            // onChanged: (pin) {
                            //   controller.otp=pin;
                            // },
                            onCompleted: (pin) {
                              controller.otp=pin;
                            }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // const Text(
                      //   'Resend Code in 01:00',
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 17),
                      // ),
                      const SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: GestureDetector(
                          onTap: () {
                              if(controller.otp.length<4){
                                Fluttertoast.showToast(msg: "Please enter otp");
                              }else{
                                controller.confirmOtp();
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
                                'Confirm',
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
                    ],
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
