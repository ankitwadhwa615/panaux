import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/wallet/controllers/wallet_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  WalletController controller = Get.put(WalletController());

  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    controller.getBalance();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }



  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    controller.verifyRazorpayTransaction(
        response.paymentId!, response.orderId!, response.signature!);;
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // print('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }
  void openCheckout(String orderId) async {
    var options = {
      'key': 'rzp_test_GVJRdB4KaByL9z',
      'amount': int.parse(controller.amount.text),
      'name': 'Panaux',
      'description': 'Add to wallet',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'order_id': orderId,
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
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
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Wallet',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: Get.width,
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black12, width: 0.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/wallet.png',
                              color: primaryColor,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "₹${controller.balance.value.balance.floorToDouble().toString()}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Your Balance',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 23,
                            ),
                            Align(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              primaryColor)),
                                  onPressed: () {
                                    Get.dialog(Center(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15.0),
                                          child: Container(
                                            width: 350,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(top: 25
                                                  ),
                                                  child: const Text(
                                                    "Enter Amount of money you want to add",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 25),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    controller: controller.amount,
                                                    cursorColor: primaryColor,
                                                    style: const TextStyle(fontWeight: FontWeight.w500),
                                                    validator: (val) {
                                                      if (val!.isEmpty) {
                                                        return 'This field is required';
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: primaryColor),
                                                      ),
                                                      focusColor: primaryColor,
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide:  BorderSide(color: primaryColor),
                                                      ),
                                                      prefixIcon: Icon(
                                                        Icons.money,
                                                        // Icons.currency_rupee,
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () async{
                                                        await controller.requestWithdrawal();
                                                        openCheckout(controller.razorpayOrderModel?.id!??"");
                                                      },
                                                      child: Container(
                                                        color: primaryColor,
                                                        height: 47,
                                                        width: 175,
                                                        child: const Center(
                                                          child: Text(
                                                            "Confirm",
                                                            style: TextStyle(color: Colors.white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius: const BorderRadius.only(
                                                                bottomLeft: Radius.circular(5)),
                                                            border: Border.all(color: primaryColor, width: 1),
                                                            color: Colors.white),
                                                        height: 47,
                                                        width: 175,
                                                        child: Center(
                                                          child: Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                              color: primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                                  },
                                  child: const Text('+ Add Money')),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 35,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Wallet transactions',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
//                      ListView(
//                      shrinkWrap: true,
//                        physics: const NeverScrollableScrollPhysics(),
//                        children: [
//                          Padding(
//                            padding: const EdgeInsets.all(3.0),
//                            child: Column(
//                              children: [
//                                SizedBox(
//                                  height: 50,
//                                  width: Get.width,
//                                  child: Row(
//                                    children: [
//                                      Expanded(
//                                        flex:3,
//                                        child: SizedBox(
//                                          height: 40,
//                                          width: 40,
//                                          child: Image.asset(
//                                            'assets/images/wallet.png',
//                                          ),
//                                        ),
//                                      ),
//                                      Expanded(
//                                        flex: 5,
//                                        child: Column(
//                                          crossAxisAlignment: CrossAxisAlignment.start,
//                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                          children: const [
//                                            Flexible(child: Text('order_JRXsfsbfsdbfgsdufguflvkn',style: TextStyle(color: Colors.black,fontSize: 13),),),
//                                            Text('05 May 2022 05:20',style: TextStyle(color: Colors.black54,fontSize: 12),)
//                                          ],
//                                        ),
//                                      ),
//                                      Expanded(
//                                        flex: 4,
//                                        child: Column(
//                                          children: const [
//                                            Text('233.00 ₹',style: TextStyle(color: Colors.black,fontSize: 18),),
//                                            Text('Deposite',style: TextStyle(color: Colors.green,fontSize: 18),)
//                                          ],
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                                const Divider(
//                                )
//                              ],
//                            ),
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.all(3.0),
//                            child: Column(
//                              children: [
//                                SizedBox(
//                                  height: 50,
//                                  width: Get.width,
//                                  child: Row(
//                                    children: [
//                                      Expanded(
//                                        flex:3,
//                                        child: SizedBox(
//                                          height: 40,
//                                          width: 40,
//                                          child: Image.asset(
//                                            'assets/images/wallet.png',
//                                          ),
//                                        ),
//                                      ),
//                                      Expanded(
//                                        flex: 5,
//                                        child: Column(
//                                          crossAxisAlignment: CrossAxisAlignment.start,
//                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                          children: const [
//                                            Flexible(child: Text('order_JRXsfsbfsdbfgsdufguflvkn',style: TextStyle(color: Colors.black,fontSize: 13),),),
//                                            Text('05 May 2022 05:20',style: TextStyle(color: Colors.black54,fontSize: 12),)
//                                          ],
//                                        ),
//                                      ),
//                                      Expanded(
//                                        flex: 4,
//                                        child: Column(
//                                          children: const [
//                                            Text('233.00 ₹',style: TextStyle(color: Colors.black,fontSize: 18),),
//                                            Text('Deposite',style: TextStyle(color: Colors.green,fontSize: 18),)
//                                          ],
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                                const Divider(
//                                )
//                              ],
//                            ),
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.all(3.0),
//                            child: Column(
//                              children: [
//                                SizedBox(
//                                  height: 50,
//                                  width: Get.width,
//                                  child: Row(
//                                    children: [
//                                      Expanded(
//                                        flex:3,
//                                        child: SizedBox(
//                                          height: 40,
//                                          width: 40,
//                                          child: Image.asset(
//                                            'assets/images/wallet.png',
//                                          ),
//                                        ),
//                                      ),
//                                      Expanded(
//                                        flex: 5,
//                                        child: Column(
//                                          crossAxisAlignment: CrossAxisAlignment.start,
//                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                          children: const [
//                                            Flexible(child: Text('order_JRXsfsbfsdbfgsdufguflvkn',style: TextStyle(color: Colors.black,fontSize: 13),),),
//                                            Text('05 May 2022 05:20',style: TextStyle(color: Colors.black54,fontSize: 12),)
//                                          ],
//                                        ),
//                                      ),
//                                      Expanded(
//                                        flex: 4,
//                                        child: Column(
//                                          children: const [
//                                            Text('233.00 ₹',style: TextStyle(color: Colors.black,fontSize: 18),),
//                                            Text('Deposite',style: TextStyle(color: Colors.green,fontSize: 18),)
//                                          ],
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                                const Divider(
//                                )
//                              ],
//                            ),
//                          ),
//
//                        ],
//                      )
                       ListView.builder(
                         shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                         itemCount: controller.walletHistory.length,
                         itemBuilder: (context, index) {
                           DateTime date =
                               controller.walletHistory[index].createdAt;
                           DateTime parseDate =
                               DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'")
                                   .parse(date.toString(), true)
                                   .toLocal();

                           var dateLocal = parseDate.toLocal();
                           var inputDate =
                               DateTime.parse(dateLocal.toString());
                           var outputFormat =
                               DateFormat('dd MMM yyyy hh:mm a');
                           var outputDate = outputFormat.format(inputDate);

 //									var parts = outputDate.split('-');
 //									var appointDate = parts[0].trim();
 //									var appointTime = parts[1].trim();

                           return Card(
                               elevation: 5,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(15.0),
                               ),
                               child: Column(
                                 children: [
                                   Container(
                                     height: 35,
                                     width: double.infinity,
                                     decoration: BoxDecoration(
                                         borderRadius:
                                             const BorderRadius.only(
                                                 topRight:
                                                     Radius.circular(15),
                                                 topLeft:
                                                     Radius.circular(15)),
                                         color: primaryColor),
                                     child: Center(
                                         child: Text(
                                       outputDate,
                                       style: const TextStyle(
                                           color: Colors.white,
                                           fontWeight: FontWeight.bold),
                                     )),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Column(
                                       children: [
                                         Center(
                                             child: Text(
                                           '₹ ' +
                                               controller
                                                   .walletHistory[index]
                                                   .amount
                                                   .toString(),
                                           style: const TextStyle(
                                               fontSize: 30,
                                               fontWeight: FontWeight.bold,
                                               color: Colors.black),
                                         )),
                                         Row(
                                           mainAxisAlignment:
                                               MainAxisAlignment
                                                   .spaceAround,
                                           children: [
                                             Column(
                                               crossAxisAlignment:
                                                   CrossAxisAlignment
                                                       .start,
                                               children: const [
                                                 SizedBox(
                                                   height: 10,
                                                 ),
                                                 Text('Id'),
                                                 SizedBox(
                                                   height: 10,
                                                 ),
                                                 Text('Email'),
                                                 SizedBox(
                                                   height: 10,
                                                 ),
                                                 Text('Transaction Type'),
                                                 SizedBox(
                                                   height: 10,
                                                 ),
                                                 Text('Status'),
                                               ],
                                             ),
                                             Column(
                                               crossAxisAlignment:
                                                   CrossAxisAlignment
                                                       .start,
                                               children: [
                                                 const SizedBox(
                                                   height: 10,
                                                 ),
                                                 Text(
                                                   controller
                                                       .walletHistory[
                                                           index]
                                                       .from
                                                       .id
                                                       .toString(),
                                                   style: const TextStyle(
                                                       fontWeight:
                                                           FontWeight
                                                               .bold),
                                                 ),
                                                 const SizedBox(
                                                   height: 10,
                                                 ),
                                                 Text(
                                                     controller
                                                         .walletHistory[
                                                             index]
                                                         .from
                                                         .email
                                                         .toString(),
                                                     style: const TextStyle(
                                                         fontWeight:
                                                             FontWeight
                                                                 .bold)),
                                                 const SizedBox(
                                                   height: 10,
                                                 ),
                                                 Text(
                                                     controller
                                                         .walletHistory[
                                                             index]
                                                         .transactionType
                                                         .toString(),
                                                     style: const TextStyle(
                                                         fontWeight:
                                                             FontWeight
                                                                 .bold)),
                                                 const SizedBox(
                                                   height: 10,
                                                 ),
                                                 Text(
                                                     controller
                                                         .walletHistory[
                                                             index]
                                                         .status,
                                                     style: const TextStyle(
                                                         color:
                                                             Colors.green,
                                                         fontWeight:
                                                             FontWeight
                                                                 .bold)),
                                               ],
                                             )
                                           ],
                                         ),
                                       ],
                                     ),
                                   ),
                                 ],
                               ));
                         },
                       )
                       //Image.asset('assets/images/wallet.png')
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
