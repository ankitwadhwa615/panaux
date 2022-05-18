import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/orders/widgets/appointment_details/appointment_details.dart';
import 'package:panaux_customer/screens/orders/widgets/order_details/order_details.dart';

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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
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
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: _views,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget appointments() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Refresh',
        style: TextStyle(
            color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      GestureDetector(
        onTap: () {
          Get.to(const AppointmentDetails());
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
                  child: const CircleAvatar(
                      backgroundColor: Colors.white, radius: 38),
                  backgroundColor: primaryColor,
                  radius: 40),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Test1'),
                  const Text("Fever"),
                  Container(
                    height: 25,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.3)),
                    child: const Center(
                      child: Text('Pending'),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '05:04 PM',
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "22 May",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '2022',
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
    ]),
  );
}

Widget orders() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Refresh',
        style: TextStyle(
            color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      GestureDetector(
        onTap: () {
          Get.to(const OrderDetails());
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
                            child: Image.asset('assets/images/tablet.png')),
                      )),
                  backgroundColor: Colors.black,
                  radius: 29),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('Order Id : 627cvhghjhbbjhgh547688989bj'),
                  Text("Pharmacy: Panaux Pharmacy"),
                  Text("05 May-2022 11:40"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("status: NEW"),
                ],
              ),
            ],
          ),
        ),
      ),
      const Divider()
    ]),
  );
}
