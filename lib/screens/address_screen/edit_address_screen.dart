import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../commons/constants.dart';
import '../../commons/widgets/text_fields.dart';
import '../wallet/apis/withdraw_request_api.dart';
import 'controllers/address_controller.dart';

class EditAddressScreen extends StatefulWidget {
	@override
	_EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
	AddressController controller = Get.put(AddressController());
	var one = Get.arguments;

	@override
	void initState() {
		controller.addressLine1.text = one[0];
		controller.addressLine2.text = one[1];
		controller.pinCode.text = one[2].toString();
		controller.country = one[3];
		controller.state = one[4];
		controller.city = one[5];
		// TODO: implement initState
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return Obx(
				() =>
				ModalProgressHUD(
					inAsyncCall: controller.updating.value,
					progressIndicator: CircularProgressIndicator(
						color: primaryColor,
						backgroundColor: Colors.black12,
						strokeWidth: 1.5,
					),
					child: Scaffold(
						backgroundColor: Colors.white,
						appBar: AppBar(
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
						body: SingleChildScrollView(
							child: Form(
								key: controller.addressFormKey,
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										const Padding(
											padding: EdgeInsets.only(left: 18, bottom: 10),
											child: Text(
												'Edit Your Address',
												style: TextStyle(
													color: Colors.black,
													fontWeight: FontWeight.w400,
													fontSize: 23),
											),
										),
										Padding(
											padding: const EdgeInsets.all(20.0),
											child: Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: [
													TextFields(
														controller: controller.addressLine1,
														title: 'Address line 1',
														type: TextInputType.streetAddress,
														prefixIcon: Icons.location_on,
														hintText: '#123 CapeTown',
													),
													const SizedBox(
														height: 20,
													),
													TextFields(
														hintText: '123',
														controller: controller.addressLine2,
														title: 'Address line 2',
														type: TextInputType.streetAddress,
														prefixIcon: Icons.location_on,
													),
													const SizedBox(
														height: 20,
													),
													TextFields(
														controller: controller.pinCode,
														title: 'Pin Code',
														type: TextInputType.number,
														prefixIcon: Icons.pin_drop,
														hintText: '500066',
													),
													const SizedBox(
														height: 20,
													),
													Padding(
														padding: const EdgeInsets.all(8.0),
														child: SelectState(
															style: const TextStyle(fontWeight: FontWeight.w500),
															onCountryChanged: (value) {
																setState(() {
																	controller.country = value;
																});
															},
															onStateChanged: (value) {
																setState(() {
																	controller.state = value;
																});
															},
															onCityChanged: (value) {
																setState(() {
																	controller.city = value;
																});
															},
														),
													),
													const SizedBox(
														height: 40,
													),
												],
											),
										),
									],
								),
							),
						),
						bottomNavigationBar: Padding(
							padding: const EdgeInsets.all(8.0),
							child: GestureDetector(
								onTap: () {
									if (controller.addressFormKey.currentState!.validate()) {
										controller.updateAddress();
									}
								},
								child: Container(
									height: 45,
									decoration: BoxDecoration(
										color: primaryColor,
										borderRadius: BorderRadius.circular(10)),
									child: const Center(
										child: Text(
											'Update',
											style: TextStyle(
												color: Colors.white,
												fontSize: 17,
												fontWeight: FontWeight.bold),
										)),
								),
							),
						),
					),
				),
		);
	}
}
