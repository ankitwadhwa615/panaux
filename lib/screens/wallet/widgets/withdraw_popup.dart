import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/wallet/controllers/wallet_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
class WithdrawalPopup extends StatefulWidget {
  const WithdrawalPopup({Key? key}) : super(key: key);

  @override
  _WithdrawalPopupState createState() => _WithdrawalPopupState();
}

class _WithdrawalPopupState extends State<WithdrawalPopup> {
  WalletController controller=Get.put(WalletController());
  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
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

  void openCheckout(String orderId) async {
    var options = {
      'key': 'rzp_test_GVJRdB4KaByL9z',
      'amount': controller.amount,
      'name': 'Panaux',
      'description': 'Order Fee',
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    controller.verifyRazorpayTransaction(
        response.paymentId!, response.orderId!, response.signature!);
    Fluttertoast.showToast(msg: 'Success Response: $response');
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

  @override
  Widget build(BuildContext context) {
    return Center(
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
                        Icons.currency_rupee,
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
                        openCheckout(controller.razorpayOrderModel?.id??"");
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
    );
  }
}
