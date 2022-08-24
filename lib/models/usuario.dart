import 'dart:convert';

import 'package:flutter/material.dart';

class Usuario {
  Usuario({
    required this.estado,
    required this.name,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    this.img,
  });

  int estado;
  String name;
  String email;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  String? img;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        estado: json["estado"],
        name: json["name"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        img: json["img"],
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "name": name,
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "img": img,
      };
}
