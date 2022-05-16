import 'package:get/get.dart';
import 'package:flutter/material.dart';


class OrdersManagement extends StatefulWidget {
  const OrdersManagement({Key? key})
      : super(key: key);

  @override
  State<OrdersManagement> createState() => _OrdersManagementState();
}

class _OrdersManagementState extends State<OrdersManagement> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>  Scaffold(
          backgroundColor: Colors.white,
          body:Container()
        ),
    );
  }
}
