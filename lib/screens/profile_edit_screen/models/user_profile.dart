import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    this.id,
    this.username,
    this.number,
    this.email,
    this.bloodGroup,
    this.joindate,
    this.addressess,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.wallet,
    this.profilePicture,
    this.status,
  });

  String? id;
  String? username;
  String? number;
  String? email;
  String? bloodGroup;
  DateTime? joindate;
  List<dynamic>? addressess;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? wallet;
  String? profilePicture;
  String? status;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    id: json["_id"] == null ? null : json["_id"],
    username: json["username"] == null ? null : json["username"],
    number: json["number"] == null ? null : json["number"],
    email: json["email"] == null ? null : json["email"],
    bloodGroup: json["blood_group"] == null ? null : json["blood_group"],
    joindate: json["joindate"] == null ? null : DateTime.parse(json["joindate"]),
    addressess: json["addressess"] == null ? null : List<dynamic>.from(json["addressess"].map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
    wallet: json["wallet"] == null ? null : json["wallet"],
    profilePicture: json["profilePicture"] == null ? null : json["profilePicture"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "username": username == null ? null : username,
    "number": number == null ? null : number,
    "email": email == null ? null : email,
    "blood_group": bloodGroup == null ? null : bloodGroup,
    "joindate": joindate == null ? null : joindate!.toIso8601String(),
    "addressess": addressess == null ? null : List<dynamic>.from(addressess!.map((x) => x)),
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "__v": v == null ? null : v,
    "wallet": wallet == null ? null : wallet,
    "profilePicture": profilePicture == null ? null : profilePicture,
    "status": status == null ? null : status,
  };
}
