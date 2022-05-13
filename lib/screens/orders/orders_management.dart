import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/orders/controllers/orders_management_controller.dart';
import 'package:panaux_customer/screens/orders/widgets/delivered_orders/delivered_orderlist.dart';
import 'package:panaux_customer/screens/orders/widgets/dispatched_orders/dispatched_orderlist.dart';
import 'package:panaux_customer/screens/orders/widgets/new_orders/new_orderslist.dart';
import 'package:panaux_customer/screens/orders/widgets/paid_orders/paid_orderlist.dart';
import 'package:panaux_customer/screens/orders/widgets/processing_orders/processing_orderlist.dart';

class OrdersManagement extends StatefulWidget {
  final bool calledByNavBar;
  const OrdersManagement({Key? key, this.calledByNavBar = false})
      : super(key: key);

  @override
  State<OrdersManagement> createState() => _OrdersManagementState();
}

class _OrdersManagementState extends State<OrdersManagement> {
  OrdersManagementController controller = Get.put(OrdersManagementController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>  Scaffold(
          backgroundColor: Colors.white,
          appBar: widget.calledByNavBar
              ? null
              : AppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
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
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: widget.calledByNavBar ? 50 : 0,
                  ),
                  const Text(
                    'Orders Management',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 23),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.tabBarsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GetBuilder(
                                init: OrdersManagementController(),
                                builder: (hi) {
                                  return GestureDetector(
                                    onTap: () {
                                      for (var element
                                          in controller.tabBarsList) {
                                        element['selected'] = false;
                                      }
                                      controller.tabBarsList[index]['selected'] =
                                          true;
                                      controller.selectedTab.value=controller.tabBarsList[index]['value'];
                                      controller.getUpdate();
                                    },
                                    child: Material(
                                      borderRadius: BorderRadius.circular(20),
                                      elevation: 4,
                                      child: Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: controller
                                                            .tabBarsList[index]
                                                        ['selected']
                                                    ? [primaryColor, primaryColor]
                                                    : [
                                                        Colors.white,
                                                        Colors.grey
                                                            .withOpacity(0.05)
                                                      ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              controller.tabBarsList[index]
                                                  ['icon'],
                                              color: controller.tabBarsList[index]
                                                      ['selected']
                                                  ? Colors.white
                                                  : primaryColor,
                                              size: 35,
                                            ),
                                            Text(
                                              controller.tabBarsList[index]
                                                  ['label'],
                                              style: TextStyle(
                                                  color: controller
                                                              .tabBarsList[index]
                                                          ['selected']
                                                      ? Colors.white
                                                      : primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }),
                  ),
                  SizedBox(
                      height: Get.height * 0.66,
                      child: controller.selectedTab.value == 0
                          ? const NewOrders()
                          : controller.selectedTab.value == 1
                              ?  const ProcessingOrdersList()
                              : controller.selectedTab.value == 2
                                  ? const PaidOrdersList()
                                  : controller.selectedTab.value == 3
                                      ? const DispatchedOrdersList()
                                      : const DeliveredOrdersList())
                ],
              ),
            ),
          ),
        ),
    );
  }
}
