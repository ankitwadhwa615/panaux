import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:panaux_customer/screens/update_password/controllers/update_password_controller.dart';

import '../../commons/constants.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  UpdatePasswordController controller = Get.put(UpdatePasswordController());
  final _formKey = GlobalKey<FormState>();
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
          backgroundColor: Colors.white,
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Change Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 23),
                    ),
                    SizedBox(
                      height: Get.height * 0.2,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: controller.oldPassword,
                      cursorColor: primaryColor,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter Old Password';
                        }
//									if(val.length < 8 ){
//										return 'Enter Valid Password';
//									}
                        return null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 1.6),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          focusColor: primaryColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: primaryColor,
                          ),
                          labelText: "Old Password",
                          labelStyle: TextStyle(color: primaryColor)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: controller.newPassword,
                      cursorColor: primaryColor,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter New Password';
                        }
//									if(val.length < 8 ){
//										return 'Enter Valid Password';
//									}
                        return null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 1.6),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          focusColor: primaryColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: primaryColor,
                          ),
                          labelText: "New Password",
                          labelStyle: TextStyle(color: primaryColor)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          controller.updatePassword();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Center(
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
