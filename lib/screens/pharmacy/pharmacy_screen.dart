import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/screens/pharmacy/pharmacy_details.dart';

import '../address_screen/address_list_screen.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: GestureDetector(
            onTap: () {
              Get.to(const AddressList());
            },
            child: const Text(
              'Please choose address',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
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
        body: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(const PharmacyDetails());
              },
              child: SizedBox(
                height: 270,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'test Store',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Text(
                          'allahbad',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Text(
                          '         ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Text(
                      '( 23 customers reviews )',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Open',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const PharmacyDetails());
              },
              child: SizedBox(
                height: 270,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'test Store',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Text(
                          'allahbad',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Text(
                          '         ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Text(
                      '( 23 customers reviews )',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Open',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const PharmacyDetails());
              },
              child: SizedBox(
                height: 270,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'test Store',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Text(
                          'allahbad',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Text(
                          '         ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Text(
                      '( 23 customers reviews )',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Open',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const PharmacyDetails());
              },
              child: SizedBox(
                height: 270,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'test Store',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Text(
                          'allahbad',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Text(
                          '         ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Text(
                      '( 23 customers reviews )',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Open',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const PharmacyDetails());
              },
              child: SizedBox(
                height: 270,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'test Store',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Text(
                          'allahbad',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Text(
                          '         ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Text(
                      '( 23 customers reviews )',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Open',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const PharmacyDetails());
              },
              child: SizedBox(
                height: 270,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'test Store',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Text(
                          'allahbad',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Text(
                          '         ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Text(
                      '( 23 customers reviews )',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Open',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const PharmacyDetails());
              },
              child: SizedBox(
                height: 270,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'test Store',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Text(
                          'allahbad',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Text(
                          '         ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Text(
                      '( 23 customers reviews )',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Open',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
