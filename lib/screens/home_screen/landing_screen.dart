// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttsf_cloud/screens/pharmacy/controllers/pharmacy_controller.dart';
import 'package:ttsf_cloud/screens/pharmacy/product_list.dart';
import '../../commons/constants.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    controller.getPharmacyList();
    super.initState();
  }

  PharmacyController controller = Get.put(PharmacyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            '123-A Model Town, YamunaNagar, Haryana',
            style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          leading: const Icon(Icons.location_on, color: Colors.red, size: 35),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/doctor.png')),
            )
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.search, size: 28, color: Colors.red),
                hintText: 'Search',
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                // do something
              },
              enabled: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: Get.height - 153,
            child: Obx(
              () => controller.gettingPharmacy.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                        backgroundColor: Colors.black12,
                        strokeWidth: 1.5,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.pharmacyList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(ProductList(
                                  data: controller.pharmacyList[index],
                                ),);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 13.0),
                                child: Material(
                                  elevation: 6,
                                  shadowColor: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black,
                                        image: DecorationImage(
                                            // opacity: 0.5,
                                            fit: BoxFit.fitWidth,
                                            image: NetworkImage(
                                              controller.pharmacyList[index]
                                                      .storeImage ??
                                                  "",
                                            ))),
                                    height: 240,
                                    width: Get.width,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 3),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            controller
                                                                    .pharmacyList[
                                                                        index]
                                                                    .storeName ??
                                                                "",
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            controller
                                                                    .pharmacyList[
                                                                        index]
                                                                    .address
                                                                    ?.city ??
                                                                "",
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 27,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6)),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                controller
                                                                    .pharmacyList[
                                                                        index]
                                                                    .averageRating
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              const Icon(
                                                                Icons.star,
                                                                size: 17,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 12.0, left: 8),
                                                child: Text(
                                                  controller.pharmacyList[index]
                                                              .status
                                                              .toString() ==
                                                          true
                                                      ? "Opened"
                                                      : "Temporarily Closed",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: controller
                                                                  .pharmacyList[
                                                                      index]
                                                                  .status
                                                                  .toString() ==
                                                              true
                                                          ? Colors.green
                                                          : Colors.red),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
