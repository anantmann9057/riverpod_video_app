// To parse this JSON data, do
//
//     final topHashtagVideos = topHashtagVideosFromMap(jsonString);

import 'dart:convert';

TopHashtagVideos topHashtagVideosFromMap(String str) =>
    TopHashtagVideos.fromMap(json.decode(str));

String topHashtagVideosToMap(TopHashtagVideos data) =>
    json.encode(data.toMap());

class TopHashtagVideos {
  bool? status;
  String? message;
  List<Datum>? data;
  Pagination? pagination;

  TopHashtagVideos({
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  factory TopHashtagVideos.fromMap(Map<String, dynamic> json) =>
      TopHashtagVideos(
        status: json["status"],
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
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "pagination": pagination?.toMap(),
      };
}

class Datum {
  int? hashtagId;
  String? hashtagName;
  int? videoCount;
  List<Video>? videos;

  Datum({
    this.hashtagId,
    this.hashtagName,
    this.videoCount,
    this.videos,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        hashtagId: json["hashtag_id"],
        hashtagName: json["hashtag_name"],
        videoCount: json["video_count"],
        videos: json["videos"] == null
            ? []
            : List<Video>.from(json["videos"]!.map((x) => Video.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "hashtag_id": hashtagId,
        "hashtag_name": hashtagName,
        "video_count": videoCount,
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x.toMap())),
      };
}

class Video {
  int? id;
  String? video;
  String? description;
  String? sound;
  String? soundName;
  int? soundId;
  int? isFavouriteSound;
  int? isFavoriteHasttag;
  String? soundCategoryName;
  dynamic filter;
  int? likes;
  int? views;
  String? gifImage;
  String? speed;
  int? comments;
  List<Hashtag>? hashtags;
  Is? isDuet;
  dynamic duetFrom;
  Is? isDuetable;
  Is? isCommentable;
  String? soundOwner;
  int? videoLikeStatus;
  User? user;

  Video({
    this.id,
    this.video,
    this.description,
    this.sound,
    this.soundName,
    this.soundId,
    this.isFavouriteSound,
    this.isFavoriteHasttag,
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

  factory Video.fromMap(Map<String, dynamic> json) => Video(
        id: json["id"],
        video: json["video"],
        description: json["description"],
        sound: json["sound"],
        soundName: json["sound_name"],
        soundId: json["sound_id"],
        isFavouriteSound: json["is_favourite_sound"],
        isFavoriteHasttag: json["is_favorite_hasttag"],
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
        isDuet: isValues.map[json["is_duet"] ?? ''],
        duetFrom: json["duet_from"],
        isDuetable: isValues.map[json["is_duetable"] ?? ''],
        isCommentable: isValues.map[json["is_commentable"] ?? 'yes'],
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
        "is_favourite_sound": isFavouriteSound,
        "is_favorite_hasttag": isFavoriteHasttag,
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
        "is_duet": isValues.reverse[isDuet],
        "duet_from": duetFrom,
        "is_duetable": isValues.reverse[isDuetable],
        "is_commentable": isValues.reverse[isCommentable],
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

enum Is { NO, YES }

final isValues = EnumValues({"No": Is.NO, "Yes": Is.YES});

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? dob;
  String? phone;
  String? avatar;
  String? socialLoginId;
  SocialLoginType? socialLoginType;
  String? firstName;
  String? lastName;
  Gender? gender;
  String? websiteUrl;
  String? bio;
  dynamic youtube;
  dynamic facebook;
  dynamic instagram;
  dynamic twitter;
  dynamic firebaseToken;
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
        socialLoginType:
            socialLoginTypeValues.map[json["social_login_type"] ?? ''],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: genderValues.map[json["gender"]]!,
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
        "social_login_type": socialLoginTypeValues.reverse[socialLoginType],
        "first_name": firstName,
        "last_name": lastName,
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
        "isfollow": isfollow,
        "likes": likes,
        "levels": levels?.toMap(),
        "total_videos": totalVideos,
        "box_two": boxTwo,
        "box_three": boxThree,
      };
}

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"Female": Gender.FEMALE, "Male": Gender.MALE});

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

enum SocialLoginType { EMPTY, GOOGLE, TRUECALLER }

final socialLoginTypeValues = EnumValues({
  "": SocialLoginType.EMPTY,
  "google": SocialLoginType.GOOGLE,
  "truecaller": SocialLoginType.TRUECALLER
});

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
