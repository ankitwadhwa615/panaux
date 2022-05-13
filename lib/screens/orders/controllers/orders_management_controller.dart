import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:panaux_customer/screens/orders/apis/add_delivered_api.dart';
import 'package:panaux_customer/screens/orders/apis/add_driver_details.dart';
import 'package:panaux_customer/screens/orders/apis/delivered_orders_api.dart';
import 'package:panaux_customer/screens/orders/apis/dispatched_orders_api.dart';
import 'package:panaux_customer/screens/orders/apis/new_orders_api.dart';
import 'package:panaux_customer/screens/orders/apis/order_details_api.dart';
import 'package:panaux_customer/screens/orders/apis/paid_orders_api.dart';
import 'package:panaux_customer/screens/orders/apis/processing_orders_api.dart';
import 'package:panaux_customer/screens/orders/models/orders_model.dart';
import 'package:panaux_customer/screens/orders/models/order_details_model.dart';

class OrdersManagementController extends GetxController {
  RxBool loading = false.obs;
  RxBool asyncCall = false.obs;
  RxInt selectedTab = 0.obs;
  TextEditingController driverName = TextEditingController();
  TextEditingController driverMobileNumber = TextEditingController();
  RxList tabBarsList = [
    {"label": "New", "icon": Icons.fiber_new, "selected": true, "value": 0},
    {
      "label": "Processing",
      "icon": CupertinoIcons.arrow_2_circlepath,
      "selected": false,
      "value": 1
    },
    {"label": "Paid", "icon": Icons.paid, "selected": false, "value": 2},
    {
      "label": "Dispatched",
      "icon": Icons.airport_shuttle_sharp,
      "selected": false,
      "value": 3
    },
    {
      "label": "Delivered",
      "icon": Icons.check_circle,
      "selected": false,
      "value": 4
    }
  ].obs;
  getUpdate() {
    update();
  }

  RxList<OrdersModel> newOrders = <OrdersModel>[].obs;
  getNewOrders() async {
    loading.value = true;
    newOrders.value = await newOrdersApi();
    newOrders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    loading.value = false;
  }

  RxList<OrdersModel> processingOrders = <OrdersModel>[].obs;
  getProcessingOrders() async {
    loading.value = true;
    processingOrders.value = await processingOrdersApi();
    processingOrders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    loading.value = false;
  }

  RxList<OrdersModel> paidOrders = <OrdersModel>[].obs;
  getPaidOrders() async {
    loading.value = true;
    paidOrders.value = await paidOrdersApi();
    paidOrders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    loading.value = false;
  }

  RxList<OrdersModel> dispatchedOrders = <OrdersModel>[].obs;
  getDispatchedOrders() async {
    loading.value = true;
    dispatchedOrders.value = await dispatchedOrdersApi();
    dispatchedOrders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    loading.value = false;
  }

  RxList<OrdersModel> deliveredOrders = <OrdersModel>[].obs;
  getDeliveredOrders() async {
    loading.value = true;
    deliveredOrders.value = await deliveredOrdersApi();
    deliveredOrders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    loading.value = false;
  }

  OrdersDetailsModel? orderDetails;
  getOrderDetails(String id) async {
    loading.value = true;
    orderDetails = await orderDetailsApi(id);
    loading.value = false;
  }

  saveDriverDetails(String id) async {
    await addDriverApi(id, driverName.text, driverMobileNumber.text);
    update();
  }
  setDelivered(String id) async {
    await addDeliveredApi(id);
    update();
  }
}
