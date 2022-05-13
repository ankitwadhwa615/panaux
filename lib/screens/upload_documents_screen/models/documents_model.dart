import 'dart:convert';

DocumentsModel documentsModelFromJson(String str) => DocumentsModel.fromJson(json.decode(str));

String documentsModelToJson(DocumentsModel data) => json.encode(data.toJson());

class DocumentsModel {
  DocumentsModel({
    required this.certificateStatus,
    required this.idProofStatus,
    required this.id,
    required this.vendor,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
     this.certificate,
     this.idProof,
  });

  String certificateStatus;
  String idProofStatus;
  String id;
  String vendor;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? certificate;
  String? idProof;

  factory DocumentsModel.fromJson(Map<String, dynamic> json) => DocumentsModel(
    certificateStatus: json["certificate_status"],
    idProofStatus: json["id_proof_status"],
    id: json["_id"],
    vendor: json["vendor"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    certificate: json["certificate"] == null ? null : json["certificate"],
    idProof: json["id_proof"] == null ? null : json["id_proof"],
  );

  Map<String, dynamic> toJson() => {
    "certificate_status": certificateStatus,
    "id_proof_status": idProofStatus,
    "_id": id,
    "vendor": vendor,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "certificate": certificate == null ? null : certificate,
    "id_proof": idProof == null ? null : idProof,
  };
}
