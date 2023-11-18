// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

UserModel userLoginModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userLoginModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool? status;
  bool? error;
  String? message;
  Data? data;

  UserModel({
    this.status,
    this.error,
    this.message,
    this.data,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "message": message,
        "data": data?.toJson(),
      };
  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "error": error,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  User? user;
  String? token;

  Data({
    this.user,
    this.token,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "token": token,
      };

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null
            ? null
            : User.fromJson(
                json["user"],
              ),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  int? id;
  String? name;
  String? username;
  dynamic email;
  String? dob;
  String? phone;
  String? avatar;
  dynamic socialLoginId;
  dynamic socialLoginType;
  String? firstName;
  String? lastName;
  String? gender;
  dynamic websiteUrl;
  String? bio;
  dynamic youtube;
  dynamic facebook;
  dynamic instagram;
  dynamic twitter;
  String? firebaseToken;
  String? referralCount;
  String? following;
  String? followers;
  String? likes;
  String? isVerified;
  Levels? levels;
  String? totalVideos;
  String? boxTwo;
  String? boxThree;
  String? referralCode;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.dob,
    this.phone,
    this.avatar,
    this.socialLoginId,
    this.socialLoginType,
    this.firstName,
    this.lastName,
    this.gender,
    this.websiteUrl,
    this.bio,
    this.youtube,
    this.facebook,
    this.instagram,
    this.twitter,
    this.firebaseToken,
    this.referralCount,
    this.following,
    this.followers,
    this.likes,
    this.isVerified,
    this.levels,
    this.totalVideos,
    this.boxTwo,
    this.boxThree,
    this.referralCode,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        dob: json["dob"],
        phone: json["phone"],
        avatar: json["avatar"],
        socialLoginId: json["social_login_id"],
        socialLoginType: json["social_login_type"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        websiteUrl: json["website_url"],
        bio: json["bio"],
        youtube: json["youtube"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        firebaseToken: json["firebase_token"],
        referralCount: json["referral_count"],
        following: json["following"],
        followers: json["followers"],
        likes: json["likes"],
        isVerified: json["is_verified"],
        levels: json["levels"] == null ? null : Levels.fromMap(json["levels"]),
        totalVideos: json["total_videos"],
        boxTwo: json["box_two"],
        boxThree: json["box_three"],
        referralCode: json["referral_code"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "dob": dob,
        "phone": phone,
        "avatar": avatar,
        "social_login_id": socialLoginId,
        "social_login_type": socialLoginType,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "website_url": websiteUrl,
        "bio": bio,
        "youtube": youtube,
        "facebook": facebook,
        "instagram": instagram,
        "twitter": twitter,
        "firebase_token": firebaseToken,
        "referral_count": referralCount,
        "following": following,
        "followers": followers,
        "likes": likes,
        "is_verified": isVerified,
        "levels": levels?.toMap(),
        "total_videos": totalVideos,
        "box_two": boxTwo,
        "box_three": boxThree,
        "referral_code": referralCode,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        dob: json["dob"],
        phone: json["phone"],
        avatar: json["avatar"],
        socialLoginId: json["social_login_id"],
        socialLoginType: json["social_login_type"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        websiteUrl: json["website_url"],
        bio: json["bio"],
        youtube: json["youtube"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        firebaseToken: json["firebase_token"],
        referralCount: json["referral_count"],
        following: json["following"],
        followers: json["followers"],
        likes: json["likes"],
        isVerified: json["is_verified"],
        levels: json["levels"] == null ? null : Levels.fromJson(json["levels"]),
        totalVideos: json["total_videos"],
        boxTwo: json["box_two"],
        boxThree: json["box_three"],
        referralCode: json["referral_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "dob": dob,
        "phone": phone,
        "avatar": avatar,
        "social_login_id": socialLoginId,
        "social_login_type": socialLoginType,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "website_url": websiteUrl,
        "bio": bio,
        "youtube": youtube,
        "facebook": facebook,
        "instagram": instagram,
        "twitter": twitter,
        "firebase_token": firebaseToken,
        "referral_count": referralCount,
        "following": following,
        "followers": followers,
        "likes": likes,
        "is_verified": isVerified,
        "levels": levels?.toJson(),
        "total_videos": totalVideos,
        "box_two": boxTwo,
        "box_three": boxThree,
        "referral_code": referralCode,
      };
}

class Levels {
  String? current;
  String? next;
  String? progress;

  Levels({
    this.current,
    this.next,
    this.progress,
  });

  factory Levels.fromMap(Map<String, dynamic> json) => Levels(
        current: json["current"],
        next: json["next"],
        progress: json["progress"],
      );

  Map<String, dynamic> toMap() => {
        "current": current,
        "next": next,
        "progress": progress,
      };
  factory Levels.fromJson(Map<String, dynamic> json) => Levels(
        current: json["current"],
        next: json["next"],
        progress: json["progress"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "next": next,
        "progress": progress,
      };
}
