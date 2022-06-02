import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  OrderDetailsModel({
    this.payment,
    this.status,
    this.amount,
    this.totalQuantity,
    this.id,
    this.vendor,
    this.client,
    this.prescription,
    this.product,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool? payment;
  String? status;
  int? amount;
  int? totalQuantity;
  String? id;
  Vendor? vendor;
  Client? client;
  String? prescription;
  List<dynamic>? product;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    payment: json["payment"] == null ? null : json["payment"],
    status: json["status"] == null ? null : json["status"],
    amount: json["amount"] == null ? null : json["amount"],
    totalQuantity: json["totalQuantity"] == null ? null : json["totalQuantity"],
    id: json["_id"] == null ? null : json["_id"],
    vendor: json["vendor"] == null ? null : Vendor?.fromJson(json["vendor"]),
    client: json["client"] == null ? null : Client?.fromJson(json["client"]),
    prescription: json["prescription"] == null ? null : json["prescription"],
    product: json["product"] == null ? null : List<dynamic>.from(json["product"]?.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime?.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime?.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "payment": payment == null ? null : payment,
    "status": status == null ? null : status,
    "amount": amount == null ? null : amount,
    "totalQuantity": totalQuantity == null ? null : totalQuantity,
    "_id": id == null ? null : id,
    "vendor": vendor == null ? null : vendor?.toJson(),
    "client": client == null ? null : client?.toJson(),
    "prescription": prescription == null ? null : prescription,
    "product": product == null ? null : List<dynamic>.from(product!.map((x) => x)),
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

class Client {
  Client({
    this.id,
    this.username,
    this.email,
  });

  String? id;
  String? username;
  String? email;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["_id"] == null ? null : json["_id"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
  };
}

class Vendor {
  Vendor({
    this.address,
    this.status,
    this.id,
    this.storeName,
    this.ownerName,
    this.number,
    this.email,
    this.type,
    this.password,
    this.openingTime,
    this.closingTime,
    this.profilePicture,
    this.storeImage,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.wallet,
  });

  Address? address;
  bool? status;
  String? id;
  String? storeName;
  String? ownerName;
  int? number;
  String? email;
  String? type;
  String? password;
  String? openingTime;
  String? closingTime;
  String? profilePicture;
  String? storeImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? wallet;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
    storeName: json["storeName"] == null ? null : json["storeName"],
    ownerName: json["ownerName"] == null ? null : json["ownerName"],
    number: json["number"] == null ? null : json["number"],
    email: json["email"] == null ? null : json["email"],
    type: json["type"] == null ? null : json["type"],
    password: json["password"] == null ? null : json["password"],
    openingTime: json["openingTime"] == null ? null : json["openingTime"],
    closingTime: json["closingTime"] == null ? null : json["closingTime"],
    profilePicture: json["profilePicture"] == null ? null : json["profilePicture"],
    storeImage: json["storeImage"] == null ? null : json["storeImage"],
    createdAt: json["createdAt"] == null ? null : DateTime?.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime?.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
    wallet: json["wallet"] == null ? null : json["wallet"],
  );

  Map<String, dynamic> toJson() => {
    "address": address == null ? null : address?.toJson(),
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "storeName": storeName == null ? null : storeName,
    "ownerName": ownerName == null ? null : ownerName,
    "number": number == null ? null : number,
    "email": email == null ? null : email,
    "type": type == null ? null : type,
    "password": password == null ? null : password,
    "openingTime": openingTime == null ? null : openingTime,
    "closingTime": closingTime == null ? null : closingTime,
    "profilePicture": profilePicture == null ? null : profilePicture,
    "storeImage": storeImage == null ? null : storeImage,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "__v": v == null ? null : v,
    "wallet": wallet == null ? null : wallet,
  };
}

class Address {
  Address({
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.pincode,
    this.country,
    this.longitude,
    this.latitude,
  });

  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  int? pincode;
  String? country;
  String? longitude;
  String? latitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    addressLine1: json["addressLine1"] == null ? null : json["addressLine1"],
    addressLine2: json["addressLine2"] == null ? null : json["addressLine2"],
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    pincode: json["pincode"] == null ? null : json["pincode"],
    country: json["country"] == null ? null : json["country"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    latitude: json["latitude"] == null ? null : json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "addressLine1": addressLine1 == null ? null : addressLine1,
    "addressLine2": addressLine2 == null ? null : addressLine2,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "pincode": pincode == null ? null : pincode,
    "country": country == null ? null : country,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
  };
}
