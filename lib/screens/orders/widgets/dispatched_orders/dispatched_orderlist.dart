import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/orders/controllers/orders_management_controller.dart';
import 'dispatched_order_details.dart';

class DispatchedOrdersList extends StatefulWidget {
  const DispatchedOrdersList({Key? key}) : super(key: key);

	@override
	_DispatchedOrdersListState createState() => _DispatchedOrdersListState();
}

class _DispatchedOrdersListState extends State<DispatchedOrdersList> {

	OrdersManagementController controller = Get.put(OrdersManagementController());

	@override
	void initState() {
		getData();
		super.initState();
	}

	void getData() async {
		controller.getDispatchedOrders();
	}

	@override
	Widget build(BuildContext context) {
		return Obx(() =>
		controller.loading.value
			? Center(
			child: CircularProgressIndicator(
				color: primaryColor,
				strokeWidth: 1.5,
			),
		)
			: Scaffold(
			backgroundColor: Colors.white,
			body: GetBuilder(
				init: OrdersManagementController(),
				builder: (ha) {
					return
						controller.dispatchedOrders.isNotEmpty
							? ListView.builder(
							itemCount: controller.dispatchedOrders.length,
							itemBuilder: (context, i) {
								return Padding(
									padding: const EdgeInsets.symmetric(vertical: 8.0),
									child: GestureDetector(
										onTap: () {
											Get.to(DispatchedOrderDetails(
												id: controller.dispatchedOrders[i].id,
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
														top: 5, right: 35, bottom: 5, left: 20),
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
																			'Order id:\n${controller.dispatchedOrders[i]
																				.id}',
																			style: const TextStyle(
																				color: Colors.black,
																				fontSize: 15,
																				fontWeight: FontWeight.w600),
																		),
																		const SizedBox(
																			height: 5,
																		),
																		Text(
																			// "${controller.newOrders[i].updatedAt.day.toString().padLeft(2, '0')}-${controller.newOrders[i].updatedAt.month..toString().padLeft(2, '0')}-${controller.newOrders[i].updatedAt.year.toString()}  ${controller.newOrders[i].updatedAt.hour.toString().padLeft(2, '0')}:${controller.newOrders[i].updatedAt.minute.toString().padLeft(2, '0')}",
																			DateFormat('dd MMMM yyyy - hh:mm a ')
																				.format(controller.dispatchedOrders[i]
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
																"₹${controller.dispatchedOrders[i].amount.toString()}",
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
										const SizedBox(height: 5,),
										const Text('No Orders Found',style: TextStyle(color: Colors.black,fontSize: 12),),
									],
								));
				},
			),
		),
		);
	}
}
