import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/orders/controllers/orders_management_controller.dart';

import 'delivered_order_details.dart';

class DeliveredOrdersList extends StatefulWidget {
  final bool completedOrders;
  const DeliveredOrdersList({Key? key, this.completedOrders = false})
      : super(key: key);

  @override
  _DeliveredOrdersListState createState() => _DeliveredOrdersListState();
}

class _DeliveredOrdersListState extends State<DeliveredOrdersList> {
  OrdersManagementController controller = Get.put(OrdersManagementController());

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    controller.getDeliveredOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: widget.completedOrders?AppBar(
          elevation: 0,
          title: const Text('Completed Orders',style: TextStyle(color: Colors.black),),
          centerTitle: true,
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
        ):AppBar(toolbarHeight: 0,elevation: 0,backgroundColor: Colors.transparent,),
        backgroundColor: Colors.white,
        body: controller.loading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                  strokeWidth: 1.5,
                ),
              )
            : GetBuilder(
                init: OrdersManagementController(),
                builder: (ha) {
                  return controller.deliveredOrders.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.deliveredOrders.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(DeliveredOrderDetails(
                                    id: controller.deliveredOrders[i].id,
                                  ));
                                },
                                child: Material(
                                  color: Colors.white,
                                  elevation: 3,
                                  child: SizedBox(
                                    width: Get.width,
                                    height: 90,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          right: 35,
                                          bottom: 5,
                                          left: 20),
                                      child: Row(
                                        children: [
                                          // Expanded(
                                          //   flex: 2,
                                          //   child: CircleAvatar(
                                          //     child: const CircleAvatar(
                                          //       radius: 23,
                                          //       backgroundColor: Colors.white,
                                          //     ),
                                          //     backgroundColor: primaryColor,
                                          //     radius: 25,
                                          //   ),
                                          // ),
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Order id:\n${controller.deliveredOrders[i].id}',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  // "${controller.deliveredOrders[i].createdAt.day.toString().padLeft(2, '0')}-${controller.deliveredOrders[i].createdAt.month..toString().padLeft(2, '0')}-${controller.deliveredOrders[i].createdAt.year.toString()}  ${controller.deliveredOrders[i].createdAt.hour.toString().padLeft(2, '0')}:${controller.deliveredOrders[i].createdAt.minute.toString().padLeft(2, '0')}",
                                                  DateFormat(
                                                          'dd MMMM yyyy - hh:mm a ')
                                                      .format(controller
                                                          .deliveredOrders[i]
                                                          .createdAt),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                                // const SizedBox(
                                                //   height: 5,
                                                // ),
                                                // Text(
                                                //   'Label Name',
                                                //   style: TextStyle(
                                                //       color: primaryColor,
                                                //       fontSize: 17,
                                                //       fontWeight: FontWeight.w600),
                                                // ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "₹${controller.deliveredOrders[i].amount.toString()}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.exclamationmark_circle,
                              color: primaryColor,
                              size: 50,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'No Delivered Orders Found',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ],
                        ));
                },
              ),
      ),
    );
  }
}
