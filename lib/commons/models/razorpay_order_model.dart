
import 'dart:convert';

RazorpayOrderModel razorpayOrderModelFromJson(String str) => RazorpayOrderModel.fromJson(json.decode(str));

String razorpayOrderModelToJson(RazorpayOrderModel data) => json.encode(data.toJson());

class RazorpayOrderModel {
  RazorpayOrderModel({
    this.id,
    this.entity,
    this.amount,
    this.amountPaid,
    this.amountDue,
    this.currency,
    this.receipt,
    this.offerId,
    this.status,
    this.attempts,
    this.notes,
    this.createdAt,
  });

  String? id;
  String? entity;
  int? amount;
  int? amountPaid;
  int? amountDue;
  String? currency;
  String? receipt;
  dynamic offerId;
  String? status;
  int? attempts;
  List<dynamic>? notes;
  int? createdAt;

  factory RazorpayOrderModel.fromJson(Map<String, dynamic> json) => RazorpayOrderModel(
    id: json["id"] == null ? null : json["id"],
    entity: json["entity"] == null ? null : json["entity"],
    amount: json["amount"] == null ? null : json["amount"],
    amountPaid: json["amount_paid"] == null ? null : json["amount_paid"],
    amountDue: json["amount_due"] == null ? null : json["amount_due"],
    currency: json["currency"] == null ? null : json["currency"],
    receipt: json["receipt"] == null ? null : json["receipt"],
    offerId: json["offer_id"],
    status: json["status"] == null ? null : json["status"],
    attempts: json["attempts"] == null ? null : json["attempts"],
    notes: json["notes"] == null ? null : List<dynamic>.from(json["notes"].map((x) => x)),
    createdAt: json["created_at"] == null ? null : json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "entity": entity == null ? null : entity,
    "amount": amount == null ? null : amount,
    "amount_paid": amountPaid == null ? null : amountPaid,
    "amount_due": amountDue == null ? null : amountDue,
    "currency": currency == null ? null : currency,
    "receipt": receipt == null ? null : receipt,
    "offer_id": offerId,
    "status": status == null ? null : status,
    "attempts": attempts == null ? null : attempts,
    "notes": notes == null ? null : List<dynamic>.from(notes!.map((x) => x)),
    "created_at": createdAt == null ? null : createdAt,
  };
}
