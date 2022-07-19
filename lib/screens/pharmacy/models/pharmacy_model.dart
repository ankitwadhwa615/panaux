import 'dart:convert';

PharmacyModel pharmacyModelFromJson(String str) => PharmacyModel.fromJson(json.decode(str));

String pharmacyModelToJson(PharmacyModel data) => json.encode(data.toJson());

class PharmacyModel {
  PharmacyModel({
    this.address,
    this.averageRating,
    this.sumRatings,
    this.totalRatings,
    this.status,
    this.id,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.document,
    this.wallet,
    this.closingTime,
    this.number,
    this.openingTime,
    this.ownerName,
    this.password,
    this.profilePicture,
    this.storeImage,
    this.storeName,
    this.type,
  });

  Address? address;
  dynamic averageRating;
  int? sumRatings;
  int? totalRatings;
  bool? status;
  String? id;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? document;
  String? wallet;
  String? closingTime;
  int? number;
  String? openingTime;
  String? ownerName;
  String? password;
  String? profilePicture;
  String? storeImage;
  String? storeName;
  String? type;

  factory PharmacyModel.fromJson(Map<String, dynamic> json) => PharmacyModel(
    averageRating: json["average_rating"] == null ? null : json["average_rating"],
    sumRatings: json["sum_ratings"] == null ? null : json["sum_ratings"],
    totalRatings: json["total_ratings"] == null ? null : json["total_ratings"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
    email: json["email"] == null ? null : json["email"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
    document: json["document"] == null ? null : json["document"],
    wallet: json["wallet"] == null ? null : json["wallet"],
    closingTime: json["closingTime"] == null ? null : json["closingTime"],
    number: json["number"] == null ? null : json["number"],
    openingTime: json["openingTime"] == null ? null : json["openingTime"],
    ownerName: json["ownerName"] == null ? null : json["ownerName"],
    password: json["password"] == null ? null : json["password"],
    profilePicture: json["profilePicture"] == null ? null : json["profilePicture"],
    storeImage: json["storeImage"] == null ? null : json["storeImage"],
    storeName: json["storeName"] == null ? null : json["storeName"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "average_rating":averageRating == null ? null : averageRating,
    "sum_ratings":sumRatings == null ? null : sumRatings,
    "total_ratings":totalRatings == null ? null : totalRatings,
    "address": address == null ? null : address?.toJson(),
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "email": email == null ? null : email,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "__v": v == null ? null : v,
    "document": document == null ? null : document,
    "wallet": wallet == null ? null : wallet,
    "closingTime": closingTime == null ? null : closingTime,
    "number": number == null ? null : number,
    "openingTime": openingTime == null ? null : openingTime,
    "ownerName": ownerName == null ? null : ownerName,
    "password": password == null ? null : password,
    "profilePicture": profilePicture == null ? null : profilePicture,
    "storeImage": storeImage == null ? null : storeImage,
    "storeName": storeName == null ? null : storeName,
    "type": type == null ? null : type,
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
