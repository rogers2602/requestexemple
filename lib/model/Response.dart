// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {
  Response({
    @required this.resposta,
  });

  String? resposta;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        resposta: json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Response": resposta,
      };
}
