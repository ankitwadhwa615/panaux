import 'dart:convert';

BookingModel bookingModelFromJson(String str) =>
    BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  BookingModel({
    this.status,
    this.paymentRefId,
    this.videoToken,
    this.prescription,
    this.id,
    this.doctor,
    this.description,
    this.title,
    this.appointmentTime,
    this.appointmentMode,
    this.appointmentFees,
    this.client,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? status;
  String? paymentRefId;
  String? videoToken;
  String? prescription;
  String? id;
  Doctor? doctor;
  String? description;
  String? title;
  DateTime? appointmentTime;
  String? appointmentMode;
  int? appointmentFees;
  Client? client;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        status: json["status"] == null ? null : json["status"],
        paymentRefId: json["paymentRefId"],
        videoToken: json["videoToken"] == null ? null : json["videoToken"],
        prescription:
            json["prescription"] == null ? null : json["prescription"],
        id: json["_id"] == null ? null : json["_id"],
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
        description: json["description"] == null ? null : json["description"],
        title: json["title"] == null ? null : json["title"],
        appointmentTime: json["appointmentTime"] == null
            ? null
            : DateTime.parse(json["appointmentTime"]),
        appointmentMode:
            json["appointmentMode"] == null ? null : json["appointmentMode"],
        appointmentFees:
            json["appointmentFees"] == null ? null : json["appointmentFees"],
        client: json["client"] == null ? null : Client.fromJson(json["client"]),
        slug: json["slug"] == null ? null : json["slug"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "paymentRefId": paymentRefId,
        "videoToken": videoToken == null ? null : videoToken,
        "prescription": prescription == null ? null : prescription,
        "_id": id == null ? null : id,
        "doctor": doctor == null ? null : doctor?.toJson(),
        "description": description == null ? null : description,
        "title": title == null ? null : title,
        "appointmentTime":
            appointmentTime == null ? null : appointmentTime?.toIso8601String(),
        "appointmentMode": appointmentMode == null ? null : appointmentMode,
        "appointmentFees": appointmentFees == null ? null : appointmentFees,
        "client": client == null ? null : client?.toJson(),
        "slug": slug == null ? null : slug,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Client {
  Client({
    this.id,
    this.username,
  });

  String? id;
  String? username;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["_id"] == null ? null : json["_id"],
        username: json["username"] == null ? null : json["username"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "username": username == null ? null : username,
      };
}

class Doctor {
  Doctor({
    this.id,
    this.email,
    this.description,
    this.name,
    this.profilePicture,
    this.qualification,
  });

  String? id;
  String? email;
  String? description;
  String? name;
  String? profilePicture;
  String? qualification;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["_id"] == null ? null : json["_id"],
        email: json["email"] == null ? null : json["email"],
        description: json["description"] == null ? null : json["description"],
        name: json["name"] == null ? null : json["name"],
        profilePicture:
            json["profilePicture"] == null ? null : json["profilePicture"],
        qualification:
            json["qualification"] == null ? null : json["qualification"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "email": email == null ? null : email,
        "description": description == null ? null : description,
        "name": name == null ? null : name,
        "profilePicture": profilePicture == null ? null : profilePicture,
        "qualification": qualification == null ? null : qualification,
      };
}
