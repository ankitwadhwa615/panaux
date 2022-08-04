import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttsf_cloud/commons/constants.dart';
import 'package:ttsf_cloud/screens/prescription/prescription_details.dart';

import 'controllers/prescription_controller.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  PrescriptionController controller = Get.put(PrescriptionController());
  @override
  void initState() {
    controller.getPrescriptionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Prescription',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: Obx(
        () => controller.gettingPrescription.value
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                  backgroundColor: Colors.black12,
                  strokeWidth: 1.5,
                ),
              )
            : controller.prescriptions.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/prescription.gif'),
                        const Text(
                          'No doctor have sent any prescription yet',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: Get.height - 100,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.prescriptions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            Get.to(PrescriptionDetailsScreen(data: controller.prescriptions[index]),);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      controller.prescriptions[index].doctor
                                              ?.name ??
                                          "",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "Prescription Id: ${controller.prescriptions[index].id ?? ""}",
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "${controller.prescriptions[index].createdAt ?? ""}",
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black54,
                                  )
                                ])),
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
