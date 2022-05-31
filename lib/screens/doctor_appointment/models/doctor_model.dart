// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  DoctorModel({
    this.clinic,
    this.symptoms,
    this.status,
    this.id,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.commission,
    this.earning,
    this.wallet,
    this.category,
    this.description,
    this.experience,
    this.gender,
    this.name,
    this.phoneNumber,
    this.profilePicture,
    this.qualification,
    this.speciality,
    this.subCategory,
    this.password,
  });

  Clinic? clinic;
  List<Category>? symptoms;
  String? status;
  String? id;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  Commission? commission;
  String? earning;
  String? wallet;
  Category? category;
  String? description;
  String? experience;
  String? gender;
  String? name;
  int? phoneNumber;
  String? profilePicture;
  String? qualification;
  String? speciality;
  Category? subCategory;
  String? password;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    clinic: json["clinic"] == null ? null : Clinic.fromJson(json["clinic"]),
    symptoms: json["symptoms"] == null ? null : List<Category>.from(json["symptoms"].map((x) => Category.fromJson(x))),
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
    email: json["email"] == null ? null : json["email"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
    commission: json["commission"] == null ? null : Commission.fromJson(json["commission"]),
    earning: json["earning"] == null ? null : json["earning"],
    wallet: json["wallet"] == null ? null : json["wallet"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    description: json["description"] == null ? null : json["description"],
    experience: json["experience"] == null ? null : json["experience"],
    gender: json["gender"] == null ? null : json["gender"],
    name: json["name"] == null ? null : json["name"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    profilePicture: json["profilePicture"] == null ? null : json["profilePicture"],
    qualification: json["qualification"] == null ? null : json["qualification"],
    speciality: json["speciality"] == null ? null : json["speciality"],
    subCategory: json["sub_category"] == null ? null : Category.fromJson(json["sub_category"]),
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toJson() => {
    "clinic": clinic == null ? null : clinic?.toJson(),
    "symptoms": symptoms == null ? null : List<dynamic>.from(symptoms!.map((x) => x.toJson())),
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "email": email == null ? null : email,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "__v": v == null ? null : v,
    "commission": commission == null ? null : commission?.toJson(),
    "earning": earning == null ? null : earning,
    "wallet": wallet == null ? null : wallet,
    "category": category == null ? null : category?.toJson(),
    "description": description == null ? null : description,
    "experience": experience == null ? null : experience,
    "gender": gender == null ? null : gender,
    "name": name == null ? null : name,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "profilePicture": profilePicture == null ? null : profilePicture,
    "qualification": qualification == null ? null : qualification,
    "speciality": speciality == null ? null : speciality,
    "sub_category": subCategory == null ? null : subCategory?.toJson(),
    "password": password == null ? null : password,
  };
}

class Category {
  Category({
    this.status,
    this.id,
    this.name,
    this.image,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.parentId,
    this.description,
  });

  bool? status;
  String? id;
  String? name;
  String? image;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? parentId;
  String? description;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    status: json["status"] == null ? null : json["status"],
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    slug: json["slug"] == null ? null : json["slug"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "slug": slug == null ? null : slug,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "__v": v == null ? null : v,
    "parentId": parentId == null ? null : parentId,
    "description": description == null ? null : description,
  };
}

class Clinic {
  Clinic({
    this.address,
    this.type,
    this.name,
  });

  Address? address;
  String? type;
  String? name;

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    type: json["type"] == null ? null : json["type"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "address": address == null ? null : address?.toJson(),
    "type": type == null ? null : type,
    "name": name == null ? null : name,
  };
}

class Address {
  Address({
    this.addressLine1,
    this.addressLine2,
    this.longitude,
    this.latitude,
    this.pincode,
    this.city,
    this.state,
  });

  String? addressLine1;
  String? addressLine2;
  String? longitude;
  String? latitude;
  int? pincode;
  String? city;
  String? state;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    addressLine1: json["addressLine1"] == null ? null : json["addressLine1"],
    addressLine2: json["addressLine2"] == null ? null : json["addressLine2"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    pincode: json["pincode"] == null ? null : json["pincode"],
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
  );

  Map<String, dynamic> toJson() => {
    "addressLine1": addressLine1 == null ? null : addressLine1,
    "addressLine2": addressLine2 == null ? null : addressLine2,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
    "pincode": pincode == null ? null : pincode,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
  };
}

class Commission {
  Commission({
    this.online,
    this.offline,
    this.id,
    this.doctor,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Line? online;
  Line? offline;
  String? id;
  String? doctor;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Commission.fromJson(Map<String, dynamic> json) => Commission(
    online: json["online"] == null ? null : Line.fromJson(json["online"]),
    offline: json["offline"] == null ? null : Line.fromJson(json["offline"]),
    id: json["_id"] == null ? null : json["_id"],
    doctor: json["doctor"] == null ? null : json["doctor"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "online": online == null ? null : online?.toJson(),
    "offline": offline == null ? null : offline?.toJson(),
    "_id": id == null ? null : id,
    "doctor": doctor == null ? null : doctor,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

class Line {
  Line({
    this.fees,
    this.duration,
  });

  int? fees;
  int? duration;

  factory Line.fromJson(Map<String, dynamic> json) => Line(
    fees: json["fees"] == null ? null : json["fees"],
    duration: json["duration"] == null ? null : json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "fees": fees == null ? null : fees,
    "duration": duration == null ? null : duration,
  };
}

