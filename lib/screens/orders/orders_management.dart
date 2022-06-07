import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/orders/widgets/appointment_details/appointment_details.dart';
import 'package:panaux_customer/screens/orders/widgets/order_details/order_details.dart';
import 'controllers/orders_controller.dart';

class OrdersManagement extends StatefulWidget {
  const OrdersManagement({Key? key}) : super(key: key);

  @override
  State<OrdersManagement> createState() => _OrdersManagementState();
}

class _OrdersManagementState extends State<OrdersManagement>
    with TickerProviderStateMixin {
  OrdersManagementController controller = Get.put(OrdersManagementController());
  static final List<Widget> _tabs = [
    SizedBox(
      height: 50,
      width: Get.width * 0.42,
      child: const Center(
          child: Text('MY APPOINTMENT', textAlign: TextAlign.center)),
    ),
    SizedBox(
      height: 50,
      width: Get.width * 0.42,
      child: const Center(
          child: Text(
        'MY ORDERS',
        textAlign: TextAlign.center,
      )),
    ),
  ];

  static final List<Widget> _views = [appointments(), orders()];
  @override
  void initState() {
    controller.getBookingsList();
    controller.getOrdersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(children: [
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
            height: Get.height - 133,
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: _views,
            ),
          ),
        ]),
      ),
    );
  }
}

Widget appointments() {
  OrdersManagementController controller = Get.put(OrdersManagementController());
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            controller.getBookingsList();
          },
          child: Row(
            children: [
              Text(
                'Refresh',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.refresh,
                color: primaryColor,
                size: 28,
              )
            ],
          ),
        ),
        Obx(
          () => controller.gettingBookings.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                    backgroundColor: Colors.black12,
                    strokeWidth: 1.5,
                  ),
                )
              : SizedBox(
                  height: Get.height-183,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.bookings.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(AppointmentDetails(data: controller.bookings[index],));
                              },
                              child: Container(
                                height: 105,
                                width: Get.width,
                                color: Colors.transparent,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                        child:  CircleAvatar(
                                          backgroundImage: NetworkImage(controller.bookings[index].doctor?.profilePicture??""),
                                            backgroundColor: Colors.white,
                                            radius: 38),
                                        backgroundColor: primaryColor,
                                        radius: 40),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(controller.bookings[index].doctor?.name??""),
                                        Text(controller.bookings[index].title??""),
                                        Container(
                                          height: 25,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  Colors.grey.withOpacity(0.3)),
                                          child:  Center(
                                            child: Text(controller.bookings[index].status?.toUpperCase()??""),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    VerticalDivider(
                                      thickness: 2,
                                      color: primaryColor,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          DateFormat('hh:mm a').format(controller.bookings[index].createdAt!.toLocal()),
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          DateFormat('dd MMM').format(controller.bookings[index].createdAt!.toLocal()),
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          controller.bookings[index].createdAt!.year.toString(),
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider()
                          ],
                        );
                      }),
                ),
        ),
      ],
    ),
  );
}

Widget orders() {
  OrdersManagementController controller = Get.put(OrdersManagementController());
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GestureDetector(
        onTap: () {
          controller.getOrdersList();
        },
        child: Row(
          children: [
            Text(
              'Refresh',
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.refresh,
              color: primaryColor,
              size: 28,
            )
          ],
        ),
      ),
      Obx(() => controller.gettingOrders.value
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
                backgroundColor: Colors.black12,
                strokeWidth: 1.5,
              ),
            )
          : SizedBox(
              height: Get.height - 183,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.orders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(OrderDetails(
                              data: controller.orders[index],
                            ));
                          },
                          child: Container(
                            height: 105,
                            width: Get.width,
                            color: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 28,
                                        child: SizedBox(
                                          height: 40,
                                          child: Center(
                                              child: Image.asset(
                                                  'assets/images/tablet.png')),
                                        )),
                                    backgroundColor: Colors.black,
                                    radius: 29),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                        'Order Id : ${controller.orders[index].id ?? ""}'),
                                    Text(
                                        "Pharmacy: ${controller.orders[index].vendor?.storeName ?? ""}"),
                                    Text(
                                      DateFormat('dd MMM yyyy hh:mm a').format(controller.orders[index].createdAt!.toLocal()),),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        "status: ${controller.orders[index].status?.toUpperCase() ?? ""}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  })))
    ]),
  );
}
