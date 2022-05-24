import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';

class PaymentModeScreen extends StatefulWidget {
  const PaymentModeScreen({Key? key}) : super(key: key);

  @override
  State<PaymentModeScreen> createState() => _PaymentModeScreenState();
}

class _PaymentModeScreenState extends State<PaymentModeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Mode of Payment',
          style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Amount to be paid: 100',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 40,),
            GestureDetector(
              onTap: (){},
              child:  Text(
                '1. Payment Gateway',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(color: Colors.black54,),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){},
              child: Text(
                '2. Pay using Wallet (Add Money)',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(color: Colors.black54,),
          ],
        ),
      ),
    );
  }
}
