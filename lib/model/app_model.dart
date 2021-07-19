import 'dart:convert';

AppModel appModelFromJson(String str) => AppModel.fromJson(json.decode(str));

String appModelToJson(AppModel data) => json.encode(data.toJson());

class AppModel {
  AppModel({
    this.code,
    this.message,
    this.format,
    this.timestamp,
  });

  int code;
  String message;
  String format;
  String timestamp;

  factory AppModel.fromJson(Map<String, dynamic> json) => AppModel(
        code: json["code"],
        message: json["message"],
        format: json["format"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "format": format,
        "timestamp": timestamp,
      };
}
