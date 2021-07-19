// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'app_model.dart';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel extends AppModel {
  LoginModel(
      {this.data, int code, String message, String format, String timestamp})
      : super(
            code: code, message: message, format: format, timestamp: timestamp);

  UserModel data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        message: json["message"],
        data: UserModel.fromJson(json["data"]),
        format: json["format"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
        "format": format,
        "timestamp": timestamp,
      };
}

class UserModel {
  UserModel({
    this.accessToken,
    this.user,
  });

  String accessToken;
  User user;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["accessToken"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.location,
    this.businessLocation,
    this.verified,
    this.stripeId,
    this.timezone,
    this.businessHours,
    this.images,
    this.onlineStore,
    this.localStore,
    this.id,
    this.name,
    this.email,
    this.userType,
    this.profilePicture,
    this.v,
    this.verifiedByAdmin,
    this.website,
    this.usageType,
  });

  Location location;
  BusinessLocation businessLocation;
  bool verified;
  String stripeId;
  String timezone;
  BusinessHours businessHours;
  List<dynamic> images;
  bool onlineStore;
  bool localStore;
  String id;
  String name;
  String email;
  int userType;
  String profilePicture;
  int v;
  bool verifiedByAdmin;
  String website;
  dynamic usageType;

  factory User.fromJson(Map<String, dynamic> json) => User(
        location: Location.fromJson(json["location"]),
        businessLocation: BusinessLocation.fromJson(json["businessLocation"]),
        verified: json["verified"],
        stripeId: json["stripeId"],
        timezone: json["timezone"],
        businessHours: BusinessHours.fromJson(json["businessHours"]),
        images: List<dynamic>.from(json["images"].map((x) => x)),
        onlineStore: json["onlineStore"],
        localStore: json["localStore"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        userType: json["userType"],
        profilePicture: json["profilePicture"],
        v: json["__v"],
        verifiedByAdmin: json["verifiedByAdmin"],
        website: json["website"],
        usageType: json["usageType"],
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "businessLocation": businessLocation.toJson(),
        "verified": verified,
        "stripeId": stripeId,
        "timezone": timezone,
        "businessHours": businessHours.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "onlineStore": onlineStore,
        "localStore": localStore,
        "_id": id,
        "name": name,
        "email": email,
        "userType": userType,
        "profilePicture": profilePicture,
        "__v": v,
        "verifiedByAdmin": verifiedByAdmin,
        "website": website,
        "usageType": usageType,
      };
}

class BusinessHours {
  BusinessHours({
    this.mon,
    this.tue,
    this.wed,
    this.thu,
    this.fri,
    this.sat,
    this.sun,
  });

  Fri mon;
  Fri tue;
  Fri wed;
  Fri thu;
  Fri fri;
  Fri sat;
  Fri sun;

  factory BusinessHours.fromJson(Map<String, dynamic> json) => BusinessHours(
        mon: Fri.fromJson(json["mon"]),
        tue: Fri.fromJson(json["tue"]),
        wed: Fri.fromJson(json["wed"]),
        thu: Fri.fromJson(json["thu"]),
        fri: Fri.fromJson(json["fri"]),
        sat: Fri.fromJson(json["sat"]),
        sun: Fri.fromJson(json["sun"]),
      );

  Map<String, dynamic> toJson() => {
        "mon": mon.toJson(),
        "tue": tue.toJson(),
        "wed": wed.toJson(),
        "thu": thu.toJson(),
        "fri": fri.toJson(),
        "sat": sat.toJson(),
        "sun": sun.toJson(),
      };
}

class Fri {
  Fri({
    this.open,
    this.close,
    this.working,
  });

  String open;
  String close;
  bool working;

  factory Fri.fromJson(Map<String, dynamic> json) => Fri(
        open: json["open"],
        close: json["close"],
        working: json["working"],
      );

  Map<String, dynamic> toJson() => {
        "open": open,
        "close": close,
        "working": working,
      };
}

class BusinessLocation {
  BusinessLocation();

  factory BusinessLocation.fromJson(Map<String, dynamic> json) =>
      BusinessLocation();

  Map<String, dynamic> toJson() => {};
}

class Location {
  Location({
    this.coordinates,
  });

  List<dynamic> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        coordinates: List<dynamic>.from(json["coordinates"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}
