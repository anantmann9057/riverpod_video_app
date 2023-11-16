// To parse this JSON data, do
//
//     final hashtagVideosModel = hashtagVideosModelFromMap(jsonString);

import 'dart:convert';

HashtagVideosModel hashtagVideosModelFromMap(String str) =>
    HashtagVideosModel.fromMap(json.decode(str));

String hashtagVideosModelToMap(HashtagVideosModel data) =>
    json.encode(data.toMap());

class HashtagVideosModel {
  bool? status;
  bool? error;
  String? message;
  List<Datum>? data;
  Pagination? pagination;

  HashtagVideosModel({
    this.status,
    this.error,
    this.message,
    this.data,
    this.pagination,
  });

  factory HashtagVideosModel.fromMap(Map<String, dynamic> json) =>
      HashtagVideosModel(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "error": error,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "pagination": pagination?.toMap(),
      };
}

class Datum {
  int? id;
  String? video;
  String? description;
  String? sound;
  int? soundId;
  int? isFavouriteSound;
  int? isFavoriteHasttag;
  SoundName? soundName;
  String? soundCategoryName;
  dynamic filter;
  int? likes;
  int? views;
  String? gifImage;
  String? speed;
  int? comments;
  IsCommentable? isCommentable;
  List<Hashtag>? hashtags;
  SoundOwner? soundOwner;
  int? videoLikeStatus;
  User? user;

  Datum({
    this.id,
    this.video,
    this.description,
    this.sound,
    this.soundId,
    this.isFavouriteSound,
    this.isFavoriteHasttag,
    this.soundName,
    this.soundCategoryName,
    this.filter,
    this.likes,
    this.views,
    this.gifImage,
    this.speed,
    this.comments,
    this.isCommentable,
    this.hashtags,
    this.soundOwner,
    this.videoLikeStatus,
    this.user,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        video: json["video"],
        description: json["description"],
        sound: json["sound"],
        soundId: json["sound_id"],
        isFavouriteSound: json["is_favourite_sound"],
        isFavoriteHasttag: json["is_favorite_hasttag"],
        soundName: soundNameValues.map[json["sound_name"] ?? ''],
        soundCategoryName: json["sound_category_name"],
        filter: json["filter"],
        likes: json["likes"],
        views: json["views"],
        gifImage: json["gif_image"],
        speed: json["speed"],
        comments: json["comments"],
        isCommentable: isCommentableValues.map[json["is_commentable"]],
        hashtags: json["hashtags"] == null
            ? []
            : List<Hashtag>.from(
                json["hashtags"]!.map((x) => Hashtag.fromMap(x))),
        soundOwner: soundOwnerValues.map[json["sound_owner"] ?? ''],
        videoLikeStatus: json["video_like_status"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "video": video,
        "description": description,
        "sound": sound,
        "sound_id": soundId,
        "is_favourite_sound": isFavouriteSound,
        "is_favorite_hasttag": isFavoriteHasttag,
        "sound_name": soundNameValues.reverse[soundName],
        "sound_category_name": soundCategoryName,
        "filter": filter,
        "likes": likes,
        "views": views,
        "gif_image": gifImage,
        "speed": speed,
        "comments": comments,
        "is_commentable": isCommentableValues.reverse[isCommentable],
        "hashtags": hashtags == null
            ? []
            : List<dynamic>.from(hashtags!.map((x) => x.toMap())),
        "sound_owner": soundOwnerValues.reverse[soundOwner],
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

enum IsCommentable { YES }

final isCommentableValues = EnumValues({"Yes": IsCommentable.YES});

enum SoundName { ORIGINAL, ORIGINAL_BY_NULL }

final soundNameValues = EnumValues({
  "original": SoundName.ORIGINAL,
  "Original by null": SoundName.ORIGINAL_BY_NULL
});

enum SoundOwner { YASH_SAINI }

final soundOwnerValues = EnumValues({"Yash Saini": SoundOwner.YASH_SAINI});

class User {
  int? id;
  SoundOwner? name;
  Username? username;
  dynamic email;
  dynamic dob;
  String? phone;
  Avatar? avatar;
  dynamic socialLoginId;
  dynamic socialLoginType;
  SoundOwner? firstName;
  SoundOwner? lastName;
  Gender? gender;
  dynamic websiteUrl;
  String? bio;
  dynamic youtube;
  dynamic facebook;
  dynamic instagram;
  dynamic twitter;
  dynamic firebaseToken;
  String? referralCount;
  String? following;
  String? followers;
  String? likes;
  int? isfollow;
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
    this.likes,
    this.isfollow,
    this.levels,
    this.totalVideos,
    this.boxTwo,
    this.boxThree,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: soundOwnerValues.map[json["name"] ?? ""],
        username: usernameValues.map[json["username"] ?? ""],
        email: json["email"],
        dob: json["dob"],
        phone: json["phone"],
        avatar: avatarValues.map[json["avatar"] ?? ""],
        socialLoginId: json["social_login_id"],
        socialLoginType: json["social_login_type"],
        firstName: soundOwnerValues.map[json["first_name"]],
        lastName: soundOwnerValues.map[json["last_name"]],
        gender: genderValues.map[json["gender"]],
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
        levels: json["levels"] == null ? null : Levels.fromMap(json["levels"]),
        totalVideos: json["total_videos"],
        boxTwo: json["box_two"],
        boxThree: json["box_three"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": soundOwnerValues.reverse[name],
        "username": usernameValues.reverse[username],
        "email": email,
        "dob": dob,
        "phone": phone,
        "avatar": avatarValues.reverse[avatar],
        "social_login_id": socialLoginId,
        "social_login_type": socialLoginType,
        "first_name": soundOwnerValues.reverse[firstName],
        "last_name": soundOwnerValues.reverse[lastName],
        "gender": genderValues.reverse[gender],
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
        "levels": levels?.toMap(),
        "total_videos": totalVideos,
        "box_two": boxTwo,
        "box_three": boxThree,
      };
}

enum Avatar { PROFILE_IMAGES1689338422 }

final avatarValues =
    EnumValues({"profile_images1689338422.": Avatar.PROFILE_IMAGES1689338422});

enum Gender { MALE }

final genderValues = EnumValues({"Male": Gender.MALE});

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

enum Username { ALBAD_GAMING }

final usernameValues = EnumValues({"albad_gaming": Username.ALBAD_GAMING});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
