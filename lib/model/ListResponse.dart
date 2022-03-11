// To parse this JSON data
// final listResponse = listResponseFromJson(jsonString);

import 'dart:convert';

List<PresetsListResponse> listResponseFromJson(String str) =>
    List<PresetsListResponse>.from(json.decode(str).map((x) => PresetsListResponse.fromJson(x)));

String listResponseToJson(List<PresetsListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PresetsListResponse {
  PresetsListResponse({
    this.chipCategory,
    this.timestamp,
    this.unlike,
    this.date,
    this.xmlConversion,
    this.description,
    this.autor,
    this.titlePost,
    this.postActive,
    this.like,
    this.img,
  });

  String? chipCategory;
  int? timestamp;
  List<String>? unlike;
  String? date;
  bool? xmlConversion = false;
  String? description;
  String? autor;
  String? titlePost;
  bool? postActive;
  List<String>? like;
  String? img;

  factory PresetsListResponse.fromJson(Map<String, dynamic> json) => PresetsListResponse(
        chipCategory: json["chipCategory"],
        timestamp: json["timestamp"],
        unlike: json["unlike"] == null ? [] : List<String>.from(json["unlike"].map((x) => x)),
        date: json["date"],
        xmlConversion: json["xml_conversion"],
        description: json["description"],
        autor: json["autor"],
        titlePost: json["title_post"],
        postActive: json["post_active"],
        like: json["like"] == null ? [] : List<String>.from(json["like"].map((x) => x)),
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "chipCategory": chipCategory,
        "timestamp": timestamp,
        "unlike": unlike,
        "date": date,
        "xml_conversion": xmlConversion,
        "description": description,
        "autor": autor,
        "title_post": titlePost,
        "post_active": postActive,
        "like": like,
        "img": img,
      };
}
