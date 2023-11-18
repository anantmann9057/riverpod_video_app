// To parse this JSON data, do
//
//     final videosModel = videosModelFromMap(jsonString);

import 'dart:convert';

VideosModel videosModelFromMap(String str) =>
    VideosModel.fromMap(json.decode(str));

String videosModelToMap(VideosModel data) => json.encode(data.toMap());

class VideosModel {
  bool? status;
  String? message;
  List<VideoDatum>? data;
  Pagination? pagination;

  VideosModel({
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  factory VideosModel.fromMap(Map<String, dynamic> json) => VideosModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<VideoDatum>.from(
                json["data"]!.map((x) => VideoDatum.fromMap(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "pagination": pagination?.toMap(),
      };
}

class VideoDatum {
  int? id;
  String? video;
  String? description;
  int? soundId;
  String? sound;
  String? soundName;
  int? isFavouriteSoundCount;
  dynamic soundCategoryName;
  dynamic filter;
  int? likes;
  int? views;
  String? gifImage;
  String? speed;
  int? comments;
  List<Hashtag>? hashtags;
  String? isDuet;
  dynamic duetFrom;
  String? isDuetable;
  String? isCommentable;
  String? soundOwner;
  int? videoLikeStatus;
  User? user;

  VideoDatum({
    this.id,
    this.video,
    this.description,
    this.soundId,
    this.sound,
    this.soundName,
    this.isFavouriteSoundCount,
    this.soundCategoryName,
    this.filter,
    this.likes,
    this.views,
    this.gifImage,
    this.speed,
    this.comments,
    this.hashtags,
    this.isDuet,
    this.duetFrom,
    this.isDuetable,
    this.isCommentable,
    this.soundOwner,
    this.videoLikeStatus,
    this.user,
  });

  factory VideoDatum.fromMap(Map<String, dynamic> json) => VideoDatum(
        id: json["id"],
        video: json["video"],
        description: json["description"],
        soundId: json["sound_id"],
        sound: json["sound"],
        soundName: json["sound_name"],
        isFavouriteSoundCount: json["is_favourite_sound_count"],
        soundCategoryName: json["sound_category_name"],
        filter: json["filter"],
        likes: json["likes"],
        views: json["views"],
        gifImage: json["gif_image"],
        speed: json["speed"],
        comments: json["comments"],
        hashtags: json["hashtags"] == null
            ? []
            : List<Hashtag>.from(
                json["hashtags"]!.map((x) => Hashtag.fromMap(x))),
        isDuet: json["is_duet"],
        duetFrom: json["duet_from"],
        isDuetable: json["is_duetable"],
        isCommentable: json["is_commentable"],
        soundOwner: json["sound_owner"],
        videoLikeStatus: json["video_like_status"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "video": video,
        "description": description,
        "sound_id": soundId,
        "sound": sound,
        "sound_name": soundName,
        "is_favourite_sound_count": isFavouriteSoundCount,
        "sound_category_name": soundCategoryName,
        "filter": filter,
        "likes": likes,
        "views": views,
        "gif_image": gifImage,
        "speed": speed,
        "comments": comments,
        "hashtags": hashtags == null
            ? []
            : List<dynamic>.from(hashtags!.map((x) => x.toMap())),
        "is_duet": isDuet,
        "duet_from": duetFrom,
        "is_duetable": isDuetable,
        "is_commentable": isCommentable,
        "sound_owner": soundOwner,
        "video_like_status": videoLikeStatus,
        "user": user?.toMap(),
      };
}

class Hashtag {
  int? id;
  String? name;

  Hashtag({
    this.id,
    this.name,
  });

  factory Hashtag.fromMap(Map<String, dynamic> json) => Hashtag(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? dob;
  String? phone;
  String? avatar;
  String? socialLoginId;
  String? socialLoginType;
  String? firstName;
  String? lastName;
  String? gender;
  String? websiteUrl;
  String? bio;
  dynamic youtube;
  dynamic facebook;
  dynamic instagram;
  dynamic twitter;
  String? firebaseToken;
  String? referralCount;
  int? following;
  int? followers;
  int? isfollow;
  String? likes;
  Levels? levels;
  String? totalVideos;
  String? boxTwo;
  String? boxThree;

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
    this.isfollow,
    this.likes,
    this.levels,
    this.totalVideos,
    this.boxTwo,
    this.boxThree,
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
        isfollow: json["isfollow"],
        likes: json["likes"],
        levels: json["levels"] == null ? null : Levels.fromMap(json["levels"]),
        totalVideos: json["total_videos"],
        boxTwo: json["box_two"],
        boxThree: json["box_three"],
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
        "isfollow": isfollow,
        "likes": likes,
        "levels": levels?.toMap(),
        "total_videos": totalVideos,
        "box_two": boxTwo,
        "box_three": boxThree,
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
}

class Pagination {
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;
  String? firstPageUrl;
  String? nextPageUrl;

  Pagination({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
    this.firstPageUrl,
    this.nextPageUrl,
  });

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"] ?? 0,
        lastPage: json["last_page"],
        perPage: json["per_page"],
        total: json["total"],
        firstPageUrl: json["first_page_url"],
        nextPageUrl: json["next_page_url"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "last_page": lastPage,
        "per_page": perPage,
        "total": total,
        "first_page_url": firstPageUrl,
        "next_page_url": nextPageUrl,
      };
}
