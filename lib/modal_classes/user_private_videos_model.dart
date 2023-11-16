// To parse this JSON data, do
//
//     final privateVideosModel = privateVideosModelFromMap(jsonString);

import 'dart:convert';

PrivateVideosModel privateVideosModelFromMap(String str) =>
    PrivateVideosModel.fromMap(json.decode(str));

String privateVideosModelToMap(PrivateVideosModel data) =>
    json.encode(data.toMap());

class PrivateVideosModel {
  bool? status;
  String? message;
  List<Datum>? data;
  bool? error;
  Pagination? pagination;

  PrivateVideosModel({
    this.status,
    this.message,
    this.data,
    this.error,
    this.pagination,
  });

  factory PrivateVideosModel.fromMap(Map<String, dynamic> json) =>
      PrivateVideosModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        error: json["error"],
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "error": error,
        "pagination": pagination?.toMap(),
      };
}

class Datum {
  int? id;
  String? video;
  String? description;
  String? sound;
  String? soundName;
  int? soundId;
  String? soundCategoryName;
  dynamic filter;
  int? likes;
  int? views;
  String? gifImage;
  String? speed;
  int? comments;
  List<HashtagElement>? hashtags;
  String? isDuet;
  dynamic duetFrom;
  String? isDuetable;
  String? isCommentable;
  String? soundOwner;
  int? videoLikeStatus;
  User? user;

  Datum({
    this.id,
    this.video,
    this.description,
    this.sound,
    this.soundName,
    this.soundId,
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

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        video: json["video"],
        description: json["description"],
        sound: json["sound"],
        soundName: json["sound_name"],
        soundId: json["sound_id"],
        soundCategoryName: json["sound_category_name"],
        filter: json["filter"],
        likes: json["likes"],
        views: json["views"],
        gifImage: json["gif_image"],
        speed: json["speed"],
        comments: json["comments"],
        hashtags: json["hashtags"] == null
            ? []
            : List<HashtagElement>.from(
                json["hashtags"]!.map((x) => HashtagElement.fromMap(x))),
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
        "sound": sound,
        "sound_name": soundName,
        "sound_id": soundId,
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

class HashtagElement {
  int? id;
  int? videoId;
  int? hashtagId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isFavouriteHashtagCount;
  HashtagHashtag? hashtag;

  HashtagElement({
    this.id,
    this.videoId,
    this.hashtagId,
    this.createdAt,
    this.updatedAt,
    this.isFavouriteHashtagCount,
    this.hashtag,
  });

  factory HashtagElement.fromMap(Map<String, dynamic> json) => HashtagElement(
        id: json["id"],
        videoId: json["video_id"],
        hashtagId: json["hashtag_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        isFavouriteHashtagCount: json["is_favourite_hashtag_count"],
        hashtag: json["hashtag"] == null
            ? null
            : HashtagHashtag.fromMap(json["hashtag"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "video_id": videoId,
        "hashtag_id": hashtagId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_favourite_hashtag_count": isFavouriteHashtagCount,
        "hashtag": hashtag?.toMap(),
      };
}

class HashtagHashtag {
  int? id;
  int? userId;
  String? name;
  int? isActive;
  dynamic description;
  DateTime? createdAt;
  DateTime? updatedAt;

  HashtagHashtag({
    this.id,
    this.userId,
    this.name,
    this.isActive,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory HashtagHashtag.fromMap(Map<String, dynamic> json) => HashtagHashtag(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        isActive: json["is_active"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "is_active": isActive,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
        currentPage: json["current_page"],
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
