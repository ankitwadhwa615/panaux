import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panaux_customer/screens/wallet/apis/get_wallet_balance_api.dart';
import 'package:panaux_customer/screens/wallet/apis/wallet_history_api.dart';
import 'package:panaux_customer/screens/wallet/apis/withdraw_request_api.dart';
import 'package:panaux_customer/screens/wallet/models/transaction_details_model.dart';
import 'package:panaux_customer/screens/wallet/models/wallet_balance_model.dart';

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

  requestWithdrawal() async {
    Get.back();
    loading.value = true;
    await withdrawalRequestApi(amount: int.parse(amount.text));
    loading.value = false;
  }
}
