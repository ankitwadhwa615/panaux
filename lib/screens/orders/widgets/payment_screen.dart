import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/orders/controllers/orders_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class OrdersPaymentModeScreen extends StatefulWidget {
  final int fee;
  final String id;
  const OrdersPaymentModeScreen({Key? key,required this.fee,required this.id}) : super(key: key);

  @override
  State<OrdersPaymentModeScreen> createState() => _OrdersPaymentModeScreenState();
}

class _OrdersPaymentModeScreenState extends State<OrdersPaymentModeScreen> {

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

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_GVJRdB4KaByL9z',
      'amount': widget.fee,
      'name': 'Panaux',
      'description': 'Consultation Fee',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    controller.paidOrder(widget.id, "paymentgateway");
    // print('Success Response: $response');
    // Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId!,
    //     toastLength: Toast.LENGTH_SHORT);
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
  OrdersManagementController controller=Get.put(OrdersManagementController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Mode of Payment',
          style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amount to be paid: ${widget.fee}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                openCheckout();
              },
              child:  Text(
                '1. Payment Gateway',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(color: Colors.black54,),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                controller.paidOrder(widget.id, "wallet");
              },
              child: Text(
                '2. Pay using Wallet (Add Money)',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(color: Colors.black54,),
          ],
        ),
      ),
    );
  }
}
