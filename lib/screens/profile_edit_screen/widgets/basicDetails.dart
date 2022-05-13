import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/commons/widgets/text_fields.dart';
import 'package:panaux_customer/screens/profile_edit_screen/controllers/update_profile_controller.dart';

class BasicDetails extends StatefulWidget {
  const BasicDetails({Key? key}) : super(key: key);

  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  UpdateProfileController controller=Get.put(UpdateProfileController());
  final ImagePicker _picker = ImagePicker();
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

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Get.back();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Get.back();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromCamera() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    setState(() {
      controller.profileImage = pickedFile;
    });
  }

  _imgFromGallery() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      controller.profileImage = pickedFile!;
    });
  }

  Widget personalDetails() {
    return Obx(()=>controller.wait.value?Container():SingleChildScrollView(
        child: Form(
          key: controller.basicFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.grey,
                    child: controller.profileImage != null
                        ? ClipOval(
                            child: Image.file(
                              File(controller.profileImage!.path),
                              width: 110,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          )
                        : controller.profileImageUrl.value==""?Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ):const SizedBox(),
                    backgroundImage: NetworkImage(controller.profileImageUrl.value),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFields(
                      controller: controller.ownerName,
                      title: 'User Name',
                      type: TextInputType.name,
                      prefixIcon: Icons.person,
                      hintText: 'John',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFields(
                      hintText: '+91xxxxxxxxxx',
                      controller: controller.phoneNumber,
                      title: 'Mobile Number',
                      type: TextInputType.phone,
                      prefixIcon: Icons.phone,
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
                  ],
                ),
              ),
            ],
          ),
        ),),
    );
  }
}
