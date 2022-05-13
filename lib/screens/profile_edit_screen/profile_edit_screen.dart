import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/profile_edit_screen/widgets/basicDetails.dart';

import 'controllers/update_profile_controller.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  void initState() {
    controller.setInitials();
    super.initState();
  }

  UpdateProfileController controller = Get.put(UpdateProfileController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.updating.value,
        progressIndicator: CircularProgressIndicator(
          color: primaryColor,
          backgroundColor: Colors.black12,
          strokeWidth: 1.5,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 23),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // tab bar view here
              Expanded(
                child: BasicDetails(),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // if (controllers.basicFormKey.currentState!.validate() &&
                //     controllers.addressFormKey.currentState!.validate()) {
                if (controller.lat.value == '' || controller.long.value == '') {
                  Fluttertoast.showToast(msg: "Please enter Coordinates");
                } else {
                  controller.updateProfile();
                }
                // }
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Update',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
