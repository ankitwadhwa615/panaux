// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/screens/pharmacy/controllers/pharmacy_controller.dart';
import 'package:panaux_customer/screens/pharmacy/pharmacy_details.dart';
import '../../commons/constants.dart';
import '../address_screen/address_list_screen.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  @override
  void initState() {
    controller.getPharmacyList();
    super.initState();
  }

  PharmacyController controller = Get.put(PharmacyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: GestureDetector(
          onTap: () {
          //  Get.to(const AddressList());
          },
          child: const Text(
            'Please choose address',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.map_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(const AddressList());
          },
        ),
      ),
      body: Obx(
        () => controller.gettingPharmacy.value
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                  backgroundColor: Colors.black12,
                  strokeWidth: 1.5,
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.pharmacyList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(PharmacyDetails(
                        data: controller.pharmacyList[index],
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 13.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            opacity: 0.5,
                            fit:BoxFit.fitWidth,
                            image:NetworkImage(controller.pharmacyList[index].storeImage ?? "", )
                          )
                        ),
                        height: 270,
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              controller.pharmacyList[index].storeName ?? "",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700,color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Text('   '),
                                    Icon(Icons.star,color: Colors.yellow,),
                                    Text(
                                      "3",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,color: Colors.white),
                                    ),
                                  ],
                                ),
                                Text(
                                  controller.pharmacyList[index].address?.city ??
                                      "",
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white),
                                ),
                                const Text(
                                  '         ',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white),
                                )
                              ],
                            ),
                            const Text(
                              '( 23 customers reviews )',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500,color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 20,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    controller.pharmacyList[index].status.toString()
                                        == true
                                        ? "Open"
                                        : "Close"
                                    ,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const Divider()
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
