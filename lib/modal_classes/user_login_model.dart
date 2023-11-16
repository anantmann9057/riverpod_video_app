// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  bool? status;
  bool? error;
  String? message;
  Data? data;

  UserLoginModel({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
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
}

class Data {
  User? user;

  Data({
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
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
  dynamic location;
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
  int? isfollow;
  String? isVerified;
  Levels? levels;
  String? totalVideos;
  String? boxTwo;
  String? boxThree;
  String? referralCode;
  int? spinWallet;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.dob,
    this.phone,
    this.avatar,
    this.location,
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
    this.isfollow,
    this.isVerified,
    this.levels,
    this.totalVideos,
    this.boxTwo,
    this.boxThree,
    this.referralCode,
    this.spinWallet,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        dob: json["dob"],
        phone: json["phone"],
        avatar: json["avatar"],
        location: json["location"],
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
        isfollow: json["isfollow"],
        isVerified: json["is_verified"],
        levels: json["levels"] == null ? null : Levels.fromJson(json["levels"]),
        totalVideos: json["total_videos"],
        boxTwo: json["box_two"],
        boxThree: json["box_three"],
        referralCode: json["referral_code"],
        spinWallet: json["spin_wallet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "dob": dob,
        "phone": phone,
        "avatar": avatar,
        "location": location,
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
        "isfollow": isfollow,
        "is_verified": isVerified,
        "levels": levels?.toJson(),
        "total_videos": totalVideos,
        "box_two": boxTwo,
        "box_three": boxThree,
        "referral_code": referralCode,
        "spin_wallet": spinWallet,
      };
}

class Levels {
  String? current;
  String? next;
  String? progress;
  String? maxLevel;

  Levels({
    this.current,
    this.next,
    this.progress,
    this.maxLevel,
  });

  factory Levels.fromJson(Map<String, dynamic> json) => Levels(
        current: json["current"],
        next: json["next"],
        progress: json["progress"],
        maxLevel: json["max_level"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "next": next,
        "progress": progress,
        "max_level": maxLevel,
      };
}
