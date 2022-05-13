import 'dart:convert';

SignUpResponseModel signUpResponseModelFromJson(String str) =>
    SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) =>
    json.encode(data.toJson());

class SignUpResponseModel {
  SignUpResponseModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.status,
    required this.id,
    required this.storeName,
    required this.ownerName,
    required this.number,
    required this.email,
    required this.type,
    required this.password,
    required this.openingTime,
    required this.closingTime,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.wallet,
  });

  bool status;
  String id;
  String storeName;
  String ownerName;
  int number;
  String email;
  String type;
  String password;
  String openingTime;
  String closingTime;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String wallet;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        id: json["_id"],
        storeName: json["storeName"],
        ownerName: json["ownerName"],
        number: json["number"],
        email: json["email"],
        type: json["type"],
        password: json["password"],
        openingTime: json["openingTime"],
        closingTime: json["closingTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        wallet: json["wallet"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "storeName": storeName,
        "ownerName": ownerName,
        "number": number,
        "email": email,
        "type": type,
        "password": password,
        "openingTime": openingTime,
        "closingTime": closingTime,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "wallet": wallet,
      };
}
