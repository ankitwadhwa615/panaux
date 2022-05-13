import 'dart:convert';

WalletBalanceModel walletBalanceModelFromJson(String str) => WalletBalanceModel.fromJson(json.decode(str));

String walletBalanceModelToJson(WalletBalanceModel data) => json.encode(data.toJson());

class WalletBalanceModel {
  WalletBalanceModel({
    required this.totalBalance,
    required this.availableBalance,
  });

  var totalBalance;
  var availableBalance;

  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) => WalletBalanceModel(
    totalBalance: json["total_balance"],
    availableBalance: json["available_balance"],
  );

  Map<String, dynamic> toJson() => {
    "total_balance": totalBalance,
    "available_balance": availableBalance,
  };
}
