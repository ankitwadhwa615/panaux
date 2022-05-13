import 'dart:convert';

TransactionDetailsModel transactionDetailsModelFromJson(String str) => TransactionDetailsModel.fromJson(json.decode(str));

String transactionDetailsModelToJson(TransactionDetailsModel data) => json.encode(data.toJson());

class TransactionDetailsModel {
	TransactionDetailsModel({
		required this.from,
		required this.to,
		 this.referenceId,
		required this.status,
		required this.id,
		required this.amount,
		required this.transactionType,
		required this.nature,
		required this.createdAt,
		required this.updatedAt,
		required this.v,
	});

	From from;
	From to;
	String? referenceId;
	String status;
	String id;
	var amount;
	String transactionType;
	dynamic nature;
	DateTime createdAt;
	DateTime updatedAt;
	int v;

	factory TransactionDetailsModel.fromJson(Map<String, dynamic> json) => TransactionDetailsModel(
		from: From.fromJson(json["from"]),
		to: From.fromJson(json["to"]),
		referenceId: json["referenceId"] == null ? null : json["referenceId"],
		status: json["status"],
		id: json["_id"],
		amount: json["amount"],
		transactionType: json["transaction_type"],
		nature: json["nature"],
		createdAt: DateTime.parse(json["createdAt"]),
		updatedAt: DateTime.parse(json["updatedAt"]),
		v: json["__v"],
	);

	Map<String, dynamic> toJson() => {
		"from": from.toJson(),
		"to": to.toJson(),
		"referenceId": referenceId == null ? null : referenceId,
		"status": status,
		"_id": id,
		"amount": amount,
		"transaction_type": transactionType,
		"nature": nature,
		"createdAt": createdAt.toIso8601String(),
		"updatedAt": updatedAt.toIso8601String(),
		"__v": v,
	};
}

class From {
	From({
		required this.id,
		required this.email,
		required this.accountType,
	});

	String id;
	String email;
	String accountType;

	factory From.fromJson(Map<String, dynamic> json) => From(
		id: json["id"],
		email: json["email"],
		accountType: json["account_type"],
	);

	Map<String, dynamic> toJson() => {
		"id": id,
		"email": email,
		"account_type": accountType,
	};
}
