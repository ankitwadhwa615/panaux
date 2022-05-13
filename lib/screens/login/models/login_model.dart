import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.address,
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
    required this.profilePicture,
    required this.storeImage,
    required this.createdAt,
    required this.updatedAt,
    this.document,
    required this.v,
    required this.wallet,
  });

  Address? address;
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
  String profilePicture;
  String storeImage;
  DateTime createdAt;
  DateTime updatedAt;
  String? document;
  int v;
  String wallet;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
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
    profilePicture: json["profilePicture"],
    storeImage: json["storeImage"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    document: json["document"]==null?"":json["document"],
    v: json["__v"],
    wallet: json["wallet"],
  );

  Map<String, dynamic> toJson() => {
    "address": address == null ? null : address?.toJson(),
    "_id": id,
    "storeName": storeName,
    "ownerName": ownerName,
    "number": number,
    "email": email,
    "type": type,
    "password": password,
    "openingTime": openingTime,
    "closingTime": closingTime,
    "profilePicture": profilePicture,
    "storeImage": storeImage,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "document": document==null?"":document,
    "__v": v,
    "wallet": wallet,
  };
}

class Address {
  Address({
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.pincode,
    required this.country,
    this.longitude,
    this.latitude,
  });

  String addressLine1;
  String addressLine2;
  String city;
  String state;
  int pincode;
  String country;
  String? longitude;
  String? latitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    addressLine1: json["addressLine1"],
    addressLine2: json["addressLine2"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    country: json["country"],
    longitude: json["longitude"]==null?"":json["longitude"],
    latitude: json["latitude"]==null?"":json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "addressLine1": addressLine1,
    "addressLine2": addressLine2,
    "city": city,
    "state": state,
    "pincode": pincode,
    "country": country,
    "longitude": longitude,
    "latitude": latitude,
  };
}
