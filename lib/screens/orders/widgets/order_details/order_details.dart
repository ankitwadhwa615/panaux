import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading:IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){Get.back();},),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Test Store',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Order Id- 8628716e6187618hhjsbsjsf',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '05 May 2022 11:40',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
              SizedBox(height: Get.height*0.4),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.home_outlined,
                      color: primaryColor,
                      size: 27,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Delivery Address-',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: primaryColor),
                    )
                  ],
                ),
              ),
              const Text(
                '123123',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              const Divider(color: Colors.black,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.money_outlined,
                      color: primaryColor,
                      size: 27,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Total Amount-',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: primaryColor),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Total',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    '0',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              MaterialButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.white),
                ),
                color: primaryColor,
                height: 40,
                minWidth: Get.width,
              )
            ],
          ),
        ),
      ),
    );
  }
}
