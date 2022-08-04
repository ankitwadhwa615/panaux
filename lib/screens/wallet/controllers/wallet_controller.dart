import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttsf_cloud/screens/wallet/apis/get_wallet_balance_api.dart';
import 'package:ttsf_cloud/screens/wallet/apis/wallet_history_api.dart';
import 'package:ttsf_cloud/screens/wallet/apis/withdraw_request_api.dart';
import 'package:ttsf_cloud/screens/wallet/models/transaction_details_model.dart';
import 'package:ttsf_cloud/screens/wallet/models/wallet_balance_model.dart';
import '../../../commons/models/razorpay_order_model.dart';

class WalletController extends GetxController {
  RxBool loading = false.obs;
  Rx<WalletBalanceModel> balance =
      WalletBalanceModel(balance: 0).obs;
  RxList<TransactionDetailsModel> walletHistory =
      <TransactionDetailsModel>[].obs;
  getBalance() async {
    loading.value = true;
    balance.value = await getWalletBalanceApi();
    walletHistory.value = await getWalletHistoryApi();
    walletHistory.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    loading.value = false;
  }

  TextEditingController amount = TextEditingController();
  RazorpayOrderModel? razorpayOrderModel;
  requestWithdrawal() async {
    Get.back();
    loading.value = true;
    razorpayOrderModel =await withdrawalRequestApi(amount: int.parse(amount.text));
    loading.value = false;
  }
  verifyRazorpayTransaction(String paymentId,String orderId,String signature )async{
    print('verifying....');
    loading.value=true;
    await verifyRazorpayTransactionApi(orderId,paymentId,signature);
    loading.value=false;
  }

}
