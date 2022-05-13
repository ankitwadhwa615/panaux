import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/forgot_password/controllers/forgot_password_controller.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());
  final _forgotPasswordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.loading.value,
        progressIndicator: CircularProgressIndicator(
          color: primaryColor,
          strokeWidth: 1.5,
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Get.back();
              },
            ),
            automaticallyImplyLeading: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text('Forgot Password', style: TextStyle(fontSize: 28)),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Center(
                  child: SizedBox(
                      height: 120,
                      child: Image.asset('assets/images/forgot_password.png')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Form(
                  key: _forgotPasswordFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'We just need your registered e-mail address to send you a new password',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: controller.email,
                        validator: (val) {
                          // Check if this field is empty
                          if (val!.isEmpty) {
                            return 'This field is required';
                          }
                          // using regular expression
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusColor: primaryColor,
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide:  BorderSide(color: primaryColor),
                            // ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: primaryColor,
                            ),
                            hintText: "abcd@gmail.com"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_forgotPasswordFormKey.currentState!.validate()) {
                            controller.forgetPassword();
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
                              'Reset Password',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
