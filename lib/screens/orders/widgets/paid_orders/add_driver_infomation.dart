import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/orders/controllers/orders_management_controller.dart';


class AddDriverInformation extends StatefulWidget {
  const AddDriverInformation({Key? key}) : super(key: key);

	@override
	_AddDriverInformationState createState() => _AddDriverInformationState();
}

class _AddDriverInformationState extends State<AddDriverInformation> {
	OrdersManagementController controller=Get.put(OrdersManagementController());
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: SingleChildScrollView(
				child: Padding(
					padding: const EdgeInsets.all(8.0),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							const SizedBox(
								height: 10,
							),
							const Padding(
								padding: EdgeInsets.all(8.0),
								child: Text(
									'Add Information',
									style: TextStyle(
										color: Colors.black,
										fontWeight: FontWeight.w700,
										fontSize: 20),
								),
							),

							Padding(
								padding:
								const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
								child: SizedBox(
									width: Get.width,
									height: 70,
									child: TextFormField(
										controller: controller.driverName,
										cursorHeight: 25,
										maxLines: 10,
										keyboardType: TextInputType.text,
										onChanged: (content) {},
										decoration: InputDecoration(
											label: Text(
												'Driver Name',
												style: TextStyle(color: primaryColor),
											),
											isDense: true,
											contentPadding: const EdgeInsets.only(left: 10, top: 25),
											focusedBorder: OutlineInputBorder(
												borderSide: BorderSide(color: primaryColor),
												borderRadius: const BorderRadius.all(
													Radius.circular(8),
												),
											),
											border: const OutlineInputBorder(
												borderRadius: BorderRadius.all(Radius.circular(8)))),
									),
								),
							),

							Padding(
								padding:
								const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
								child: SizedBox(
									width: Get.width,
									height: 70,
									child: TextFormField(
										controller: controller.driverMobileNumber,
										cursorHeight: 25,
										keyboardType: TextInputType.text,
										onChanged: (content) {},
										decoration: InputDecoration(
											label: Text(
												'Driver Mobile Number',
												style: TextStyle(color: primaryColor),
											),
											isDense: true,
											contentPadding: const EdgeInsets.only(left: 10, top: 25),
											focusedBorder: OutlineInputBorder(
												borderSide: BorderSide(color: primaryColor),
												borderRadius: const BorderRadius.all(
													Radius.circular(8),
												),
											),
											border: const OutlineInputBorder(
												borderRadius: BorderRadius.all(Radius.circular(8)))),
									),
								),
							),
						],
					),
				),
			),
		);
	}
}
