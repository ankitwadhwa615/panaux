import 'dart:convert';

WalletBalanceModel walletBalanceModelFromJson(String str) => WalletBalanceModel.fromJson(json.decode(str));

String walletBalanceModelToJson(WalletBalanceModel data) => json.encode(data.toJson());

class WalletBalanceModel {
  WalletBalanceModel({
    required this.balance,
   // required this.availableBalance,
  });

  double balance;
  //var availableBalance;

  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) => WalletBalanceModel(
	  balance: json["balance"],
  //  availableBalance: json["available_balance"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
   // "available_balance": availableBalance,
  };
}
