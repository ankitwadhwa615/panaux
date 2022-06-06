import 'dart:convert';

PrescriptionModel prescriptionModelFromJson(String str) => PrescriptionModel.fromJson(json.decode(str));

String prescriptionModelToJson(PrescriptionModel data) => json.encode(data.toJson());

class PrescriptionModel {
  PrescriptionModel({
    this.id,
    this.remarks,
    this.medicines,
    this.doctor,
    this.client,
    this.booking,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? remarks;
  List<Medicine>? medicines;
  Doctor? doctor;
  String? client;
  Booking? booking;
  DateTime? createdAt;
  DateTime?updatedAt;
  int? v;

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) => PrescriptionModel(
    id: json["_id"] == null ? null : json["_id"],
    remarks: json["remarks"] == null ? null : json["remarks"],
    medicines: json["medicines"] == null ? null : List<Medicine>.from(json["medicines"].map((x) => Medicine.fromJson(x))),
    doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
    client: json["client"] == null ? null : json["client"],
    booking: json["booking"] == null ? null : Booking.fromJson(json["booking"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "remarks": remarks == null ? null : remarks,
    "medicines": medicines == null ? null : List<dynamic>.from(medicines!.map((x) => x.toJson())),
    "doctor": doctor == null ? null : doctor?.toJson(),
    "client": client == null ? null : client,
    "booking": booking == null ? null : booking?.toJson(),
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

class Booking {
  Booking({
    this.id,
    this.description,
    this.title,
    this.appointmentMode,
  });

  String? id;
  String? description;
  String? title;
  String? appointmentMode;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["_id"] == null ? null : json["_id"],
    description: json["description"] == null ? null : json["description"],
    title: json["title"] == null ? null : json["title"],
    appointmentMode: json["appointmentMode"] == null ? null : json["appointmentMode"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "description": description == null ? null : description,
    "title": title == null ? null : title,
    "appointmentMode": appointmentMode == null ? null : appointmentMode,
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
    profilePicture: json["profilePicture"] == null ? null : json["profilePicture"],
    qualification: json["qualification"] == null ? null : json["qualification"],
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

class Medicine {
  Medicine({
    this.id,
    this.name,
    this.abbrv,
    this.days,
  });

  String? id;
  String? name;
  String? abbrv;
  int? days;

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
    abbrv: json["abbrv"] == null ? null : json["abbrv"],
    days: json["days"] == null ? null : json["days"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
    "abbrv": abbrv == null ? null : abbrv,
    "days": days == null ? null : days,
  };
}
