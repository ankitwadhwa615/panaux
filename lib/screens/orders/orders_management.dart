import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:panaux_customer/commons/constants.dart';

class OrdersManagement extends StatefulWidget {
  const OrdersManagement({Key? key}) : super(key: key);

  @override
  State<OrdersManagement> createState() => _OrdersManagementState();
}

class _OrdersManagementState extends State<OrdersManagement>
    with TickerProviderStateMixin {
  static final List<Widget> _tabs = [
     SizedBox(
      height: 50,
      width: Get.width * 0.42,
      child: const Center(child: Text('MY APPOINTMENT',textAlign: TextAlign.center)),
    ),
     SizedBox(
      height: 50,
      width: Get.width * 0.42,
      child: const Center(child: Text('MY ORDERS',textAlign: TextAlign.center,)),
    ),
  ];

  static const List<Widget> _views = [
    Center(
      child: Text('Content of Tab One'),
    ),
    Center(
      child: Text('Content of Tab Two'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              Column( children: [
            const SizedBox(
              height: 25,
            ),
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w600),
              indicatorWeight: 2,
              indicatorColor: primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              tabs: _tabs,
            ),
            SizedBox(
              height: Get.height - 100,
              child: const TabBarView(
                physics: BouncingScrollPhysics(),
                children: _views,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
