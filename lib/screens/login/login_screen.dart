import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ttsf_cloud/commons/constants.dart';
import 'package:ttsf_cloud/screens/forgot_password/forgot_password.dart';
import 'package:ttsf_cloud/screens/login/controllers/login_controller.dart';
import 'package:ttsf_cloud/screens/registration_screen/email_verification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  LoginController controller = Get.put(LoginController());
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
          body: Stack(
            //alignment: Alignment.center,
            children: <Widget>[
              const Positioned(
                top: 60,
                left: 30,
                child: Text('Login',style:TextStyle(fontSize:28))
              ),
              Positioned(
                top: Get.height * .13,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(40),
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Center(
                          child: SizedBox(
                              height: 100,
                              child:
                                  Image.asset('assets/images/logo.png')),
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Email Address',
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            controller: controller.email,
                            cursorColor: primaryColor,
                            style: const TextStyle(fontWeight: FontWeight.w500),
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
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: controller.password,
                            cursorColor: primaryColor,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Password';
                              }
//									if(val.length < 8 ){
//										return 'Enter Valid Password';
//									}
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
                                Icons.vpn_key,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            if (_loginFormKey.currentState!.validate()) {
                              controller.login();
                            }
                          },
                          child: Container(
                            height: 35,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: const Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () async{
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword()));
                              },
                              child: const Text(
                                'Forgot password?',
                                style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: InkWell(
                            onTap: () async{
                              Get.to(const EmailVerification());
                            },
                            child: Text(
                              'Sign up for new account ?',
                              style:
                              TextStyle(fontSize: 15, color: primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
