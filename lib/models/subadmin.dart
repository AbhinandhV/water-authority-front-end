// To parse this JSON data, do
//
//     final subadmin = subadminFromJson(jsonString);

import 'dart:convert';

List<Subadmin> subadminFromJson(String str) => List<Subadmin>.from(json.decode(str).map((x) => Subadmin.fromJson(x)));

String subadminToJson(List<Subadmin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subadmin {
  String id;
  String subadminName;
  String subadminPlace;
  String subadminPhone;
  String subadminEmail;
  String username;
  String password;
  int v;

  Subadmin({
    required this.id,
    required this.subadminName,
    required this.subadminPlace,
    required this.subadminPhone,
    required this.subadminEmail,
    required this.username,
    required this.password,
    required this.v,
  });

  factory Subadmin.fromJson(Map<String, dynamic> json) => Subadmin(
    id: json["_id"],
    subadminName: json["subadmin_name"],
    subadminPlace: json["subadmin_place"],
    subadminPhone: json["subadmin_phone"],
    subadminEmail: json["subadmin_email"],
    username: json["username"],
    password: json["password"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "subadmin_name": subadminName,
    "subadmin_place": subadminPlace,
    "subadmin_phone": subadminPhone,
    "subadmin_email": subadminEmail,
    "username": username,
    "password": password,
    "__v": v,
  };
}
