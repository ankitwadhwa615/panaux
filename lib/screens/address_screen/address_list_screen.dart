import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ttsf_cloud/commons/constants.dart';
import 'package:ttsf_cloud/screens/address_screen/edit_address_screen.dart';
import 'package:ttsf_cloud/screens/address_screen/google_map_screen.dart';
import 'controllers/address_controller.dart';

class AddressList extends StatefulWidget {
	const AddressList({Key? key}) : super(key: key);

	@override
	State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
	AddressController controller = Get.put(AddressController());

	@override
	void initState() {
		controller.getCurrentLocation();
		controller.addressList();
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return Obx(() =>
			ModalProgressHUD(
				inAsyncCall: controller.asyncCall.value,
				progressIndicator: CircularProgressIndicator(
					color: primaryColor,
					strokeWidth: 1.5,
				),
				child: Scaffold(
					backgroundColor: Colors.white,
					appBar: AppBar(
						backgroundColor: Colors.transparent,
						elevation: 0,
						leading: IconButton(
							icon: const Icon(Icons.arrow_back_sharp, color: Colors.black),
							onPressed: () {
								Get.back();
							}),
					),
					body: SingleChildScrollView(

					  child: Padding(
					  	padding: const EdgeInsets.all(18.0),
					  	child: Column(
					  		crossAxisAlignment: CrossAxisAlignment.start,
					  		children: [
					  			const Text(
					  				'Address List',
					  				style: TextStyle(
					  					color: Colors.black,
					  					fontSize: 25,
					  					fontWeight: FontWeight.w400),
					  			),

					  			ListView.builder(
								    physics: ScrollPhysics(),
					  				shrinkWrap: true,
					  				scrollDirection: Axis.vertical,
					  				itemCount: controller.addresses.length,
					  				itemBuilder: (context, index) {
					  					return Card(
					  						elevation: 5,
					  						child: Padding(
					  							padding: const EdgeInsets.all(10.0),
					  							child: Row(

					  								mainAxisAlignment: MainAxisAlignment.spaceBetween,
					  								children: [
					  									Column(
					  										crossAxisAlignment: CrossAxisAlignment.start,
					  										children: [
					  											Text(controller.addresses[index]['addressLine1']),
					  											Text(controller.addresses[index]['addressLine2']),
					  											Text(controller.addresses[index]['pincode'].toString()),
					  											Text(controller.addresses[index]['city']),
					  											Text(controller.addresses[index]['state']),
					  											Text(controller.addresses[index]['country']),
					  										],
					  									),

					  									Column(
					  										crossAxisAlignment: CrossAxisAlignment.start,
					  										children: [
					  											InkWell(
					  												onTap: () {
					  													Get.to(EditAddressScreen(), arguments: [
					  														controller.addresses[index]['addressLine1'],
					  														controller.addresses[index]['addressLine2'],
					  														controller.addresses[index]['pincode'],
					  														controller.addresses[index]['country'],
					  														controller.addresses[index]['state'],
					  														controller.addresses[index]['city'],

					  													]);
					  												},
					  												child: Icon(Icons.edit)),
					  											SizedBox(height: 10,),
					  											InkWell(
					  												onTap: () {
					  													controller.addressId =
					  													controller.addresses[index]['_id'];
					  													controller.deleteAddress();
					  												},
					  												child: Icon(Icons.delete)),


					  										],
					  									)
					  								],
					  							),
					  						),
					  					);
					  				}),

//								Align(
//									alignment: Alignment.center,
//									child: Stack(
//										children: [
//											Image.asset('assets/images/address.gif'),
//											Positioned(
//												left: Get.width * 0.28,
//												bottom: 40,
//												child: Text(
//													'How can we find you?',
//													style: TextStyle(
//														color: Colors.black.withOpacity(0.6),
//														fontSize: 15,
//														fontWeight: FontWeight.normal),
//												),
//											),
//										],
//									),
//								),
					  			Align(
					  				alignment: Alignment.center,
					  				child: MaterialButton(
					  					onPressed: () {
					  						Get.to(GoogleMapScreen(lat: double.parse(controller.lat.value), long: double
					  							.parse(controller.long.value),));
					  					},
					  					height: 40,
					  					minWidth: 200,
					  					child: const Text(
					  						'ADD NEW ADDRESS',
					  						style: TextStyle(color: Colors.white),
					  					),
					  					color: primaryColor,
					  				),),
					  		],
					  	),
					  ),
					),
				),
			),
		);
	}
}
