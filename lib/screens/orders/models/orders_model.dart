import 'dart:convert';

OrdersModel ordersModelFromJson(String str) =>
    OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  OrdersModel({
    required this.payment,
    required this.status,
    required this.amount,
     this.totalQuantity,
    required this.id,
    required this.vendor,
    required this.client,
     this.prescription,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  bool payment;
  String status;
  num amount;
  int? totalQuantity;
  String id;
  String vendor;
  Client client;
  String? prescription;
  List<dynamic> product;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        payment: json["payment"],
        status: json["status"],
        amount: json["amount"],
        totalQuantity: json["totalQuantity"]==null?0:json["totalQuantity"],
        id: json["_id"],
        vendor: json["vendor"],
        client: Client.fromJson(json["client"]),
        prescription: json["prescription"]==null?"":json["prescription"],
        product: List<dynamic>.from(json["product"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "payment": payment,
        "status": status,
        "amount": amount,
        "totalQuantity": totalQuantity,
        "_id": id,
        "vendor": vendor,
        "client": client.toJson(),
        "prescription": prescription,
        "product": List<dynamic>.from(product.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Client {
  Client({
    required this.id,
    required this.username,
    required this.email,
  });

  String id;
  String username;
  String email;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
      };
}
