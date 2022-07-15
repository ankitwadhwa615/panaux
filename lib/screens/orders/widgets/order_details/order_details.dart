import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/orders/widgets/payment_screen.dart';
import '../../controllers/orders_controller.dart';
import '../../models/order_details_model.dart';

class OrderDetails extends StatefulWidget {
  final OrderDetailsModel data;
  const OrderDetails({Key? key, required this.data}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  OrdersManagementController controller = Get.put(OrdersManagementController());
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.loading.value,
        progressIndicator: CircularProgressIndicator(
          color: primaryColor,
          strokeWidth: 1.5,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.vendor?.storeName ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Status- ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        Text(
                          widget.data.status?.toUpperCase() ?? '',
                          style: TextStyle(
                              color: widget.data.status?.toUpperCase() ==
                                      "CANCELLED"
                                  ? Colors.red
                                  : Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Order Id- ${widget.data.id ?? ''}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      DateFormat('dd MMM yyyy hh:mm a')
                          .format(widget.data.createdAt!.toLocal()),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: SizedBox(
                            height: Get.height * 0.3,
                            child: Image.network(
                              widget.data.prescription ?? "",
                              fit: BoxFit.cover,
                            ))),
                  ),
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
                  const Divider(
                    color: Colors.black,
                  ),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        widget.data.amount.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  widget.data.status?.toUpperCase() == "CANCELLED" ||
                          widget.data.status?.toUpperCase() == "DELIVERED"
                      ? const SizedBox()
                      : MaterialButton(
                          onPressed: () {
                            if (widget.data.status?.toUpperCase() ==
                                "PROCESSING") {
                              Get.to(OrdersPaymentModeScreen(
                                fee: widget.data.amount!,
                                id: widget.data.id!,
                              ));
                            } else {
                              controller.cancelOrder(widget.data.id!);
                            }
                          },
                          child: Text(
                            widget.data.status?.toUpperCase() == "PROCESSING"
                                ? 'PAY NOW'
                                : 'CANCEL',
                            style: const TextStyle(color: Colors.white),
                          ),
                          color: primaryColor,
                          height: 40,
                          minWidth: Get.width,
                        ),
                  widget.data.status?.toUpperCase() == "DELIVERED"
                      ? widget.data.ratings! ? const SizedBox() :rating()
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget rating() {
    return Obx(
      () => controller.ratings.value? Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Thank you for the Rating',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star,
                      size: 40,
                      color: controller.rating.value >= 1
                          ? Colors.yellow
                          : Colors.black.withOpacity(0.2)),
              Icon(Icons.star,
                      size: 40,
                      color: controller.rating.value >= 2
                          ? Colors.yellow
                          : Colors.black.withOpacity(0.2)),
              Icon(Icons.star,
                      size: 40,
                      color: controller.rating.value >= 3
                          ? Colors.yellow
                          : Colors.black.withOpacity(0.2)),
            Icon(Icons.star,
                      size: 40,
                      color: controller.rating.value >= 4
                          ? Colors.yellow
                          : Colors.black.withOpacity(0.2)),
              Icon(Icons.star,
                      size: 40,
                      color: controller.rating.value >= 5
                          ? Colors.yellow
                          : Colors.black.withOpacity(0.2)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ):Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Add Rating',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          controller.rating.value == 0
              ? const SizedBox()
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "${controller.rating.value == 5 ? 'A Great' : controller.rating.value == 4 ? 'A Good' : controller.rating.value == 3 ? 'An Average' : controller.rating.value == 2 ? 'A Bad' : controller.rating.value == 1 ? 'A Worst' : ''} Experience",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    controller.rating.value = 1;
                  },
                  icon: Icon(Icons.star,
                      size: 40,
                      color: controller.rating.value >= 1
                          ? Colors.yellow
                          : Colors.black.withOpacity(0.2))),
              IconButton(
                  onPressed: () {
                    controller.rating.value = 2;
                  },
                  icon: Icon(Icons.star,
                      size: 40,
                      color: controller.rating.value >= 2
                          ? Colors.yellow
                          : Colors.black.withOpacity(0.2))),
              IconButton(
                  onPressed: () {
                    controller.rating.value = 3;
                  },
                  icon: Icon(Icons.star,
                      size: 40,
                      color: controller.rating.value >= 3
                          ? Colors.yellow
                          : Colors.black.withOpacity(0.2))),
              IconButton(
                  onPressed: () {
                    controller.rating.value = 4;
                  },
                  icon: Icon(Icons.star,
                      size: 40,
                      color: controller.rating.value >= 4
                          ? Colors.yellow
                          : Colors.black.withOpacity(0.2))),
              IconButton(
                  onPressed: () {
                    controller.rating.value = 5;
                  },
                  icon: Icon(Icons.star,
                      size: 40,
                      color: controller.rating.value >= 5
                          ? Colors.yellow
                          : Colors.black.withOpacity(0.2))),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // TextFormField(
          //   minLines:
          //       6, // any number you need (It works as the rows for the textarea)
          //   keyboardType: TextInputType.multiline,
          //   maxLines: null,
          //   decoration:  InputDecoration(
          //     hintText: 'share your feedback',
          //     hintStyle: const TextStyle(color: Colors.grey),
          //     border: OutlineInputBorder(
          //      borderSide:BorderSide(color:primaryColor),
          //       borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          MaterialButton(
            onPressed: () {
              controller.addRating(widget.data.vendor!.id!, widget.data.id!, widget.data.client!.id!, );
            },
            child: const Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
            color: primaryColor,
            height: 40,
            minWidth: Get.width,
          ),
        ]),
      ),
    );
  }
}
