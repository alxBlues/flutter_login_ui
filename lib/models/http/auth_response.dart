import 'dart:convert';

import 'package:flutter_login_ui/models/usuario.dart';

class ResponseApi {
  ResponseApi({
    required this.usuario,
    required this.token,
  });

  Usuario usuario;
  String token;

  factory ResponseApi.fromJson(String str) =>
      ResponseApi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseApi.fromMap(Map<String, dynamic> json) => ResponseApi(
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token,
      };
}
