import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/upload_documents_screen/controllers/upload_documents_controller.dart';

class UploadDocumentScreen extends StatefulWidget {
  const UploadDocumentScreen({Key? key}) : super(key: key);

  @override
  _UploadDocumentScreenState createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  final ImagePicker _picker = ImagePicker();
  UploadDocumentController controller = Get.put(UploadDocumentController());
  @override
  void initState() {
    controller.getDocuments();
    super.initState();
  }

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Documents',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 23),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showPicker(context, 'idProof');
                        },
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: Get.width,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black12, width: 0.5),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              // ignore: deprecated_member_use
                              child: controller.idProof.value.path == ''
                                  ? controller.documentsModel?.idProof !=
                                              null &&
                                          controller.documentsModel?.idProof !=
                                              ''
                                      ? Image.network(
                                          controller.documentsModel!.idProof!,
                                          fit: BoxFit.cover,
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                height: 90,
                                                child: Image.asset(
                                                    'assets/images/upload.png')),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            const Text(
                                              '(Click to upload)',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            const Text(
                                              'ID Proof',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                          ],
                                        )
                                  : Image.file(
                                      File(controller.idProof.value.path),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      if (controller.documentsModel?.idProof != null &&
                          controller.documentsModel?.idProof != '')
                        Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  controller.deleteDocument('idProof');
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 28,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            radius: 25,
                            backgroundColor: Colors.white,
                          ),
                        )
                      else if (controller.idProof.value.path != '')
                        Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  controller.idProof.value = XFile('');
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 28,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            radius: 25,
                            backgroundColor: Colors.white,
                          ),
                        )
                      else
                        const SizedBox()
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showPicker(context, 'certificate');
                        },
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: Get.width,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black12, width: 0.5),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                // ignore: deprecated_member_use
                                child: controller.certificate.value.path == ''
                                    ? controller.documentsModel?.certificate !=
                                                null &&
                                            controller.documentsModel
                                                    ?.certificate !=
                                                ''
                                        ? Image.network(
                                            controller
                                                .documentsModel!.certificate!,
                                            fit: BoxFit.cover,
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  height: 90,
                                                  child: Image.asset(
                                                      'assets/images/upload.png')),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              const Text(
                                                '(Click to upload)',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              const Text(
                                                'Certificate',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                            ],
                                          )
                                    : Image.file(
                                        File(controller.certificate.value.path),
                                        fit: BoxFit.cover,
                                      )),
                          ),
                        ),
                      ),
                      if (controller.documentsModel?.certificate != null &&
                              controller.documentsModel?.certificate != '') Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      controller.deleteDocument('certificate');
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 28,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                radius: 25,
                                backgroundColor: Colors.white,
                              ),
                            )
                      else if (controller.certificate.value.path != '')
                        Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  controller.certificate.value = XFile('');
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 28,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            radius: 25,
                            backgroundColor: Colors.white,
                          ),
                        )else const SizedBox()
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              if (controller.idProof.value.path != '' &&
                      controller.documentsModel?.certificate != null ||
                  controller.certificate.value.path != '' &&
                      controller.documentsModel?.idProof != null ||
                  controller.idProof.value.path != '' &&
                      controller.certificate.value.path != '') {
                controller.uploadDocument();
              } else {
                Fluttertoast.showToast(
                    msg: "Please attach both documents required");
              }
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(3)),
                child: const Center(
                  child: Text(
                    'Upload',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context, String type) {
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
                      _imgFromGallery(type);
                      Get.back();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera(type);
                    Get.back();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromCamera(String type) async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    setState(() {
      type == 'idProof'
          ? controller.idProof.value = pickedFile!
          : controller.certificate.value = pickedFile!;
    });
  }

  _imgFromGallery(String type) async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      type == 'idProof'
          ? controller.idProof.value = pickedFile!
          : controller.certificate.value = pickedFile!;
    });
  }
}
