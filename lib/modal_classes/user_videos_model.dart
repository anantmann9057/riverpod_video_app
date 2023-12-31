// To parse this JSON data, do
//
//     final userVideosModel = userVideosModelFromMap(jsonString);

import 'dart:convert';

UserVideosModel userVideosModelFromMap(String str) => UserVideosModel.fromMap(json.decode(str));

String userVideosModelToMap(UserVideosModel data) => json.encode(data.toMap());

class UserVideosModel {
  bool? status;
  String? message;
  List<UserVideos> data;
  bool? error;
  Pagination? pagination;

  UserVideosModel({
    this.status,
    this.message,
    required this.data,
    this.error,
    this.pagination,
  });

  UserVideosModel copyWith({
    bool? status,
    String? message,
    List<UserVideos>? data,
    bool? error,
    Pagination? pagination,
  }) =>
      UserVideosModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        error: error ?? this.error,
        pagination: pagination ?? this.pagination,
      );

  factory UserVideosModel.fromMap(Map<String, dynamic> json) => UserVideosModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<UserVideos>.from(json["data"]!.map((x) => UserVideos.fromMap(x))),
    error: json["error"],
    pagination: json["pagination"] == null ? null : Pagination.fromMap(json["pagination"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "error": error,
    "pagination": pagination?.toMap(),
  };
}

class UserVideos {
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
  dynamic hashtags;
  String? isDuet;
  dynamic duetFrom;
  String? isDuetable;
  String? isCommentable;
  String? soundOwner;
  User? user;

  UserVideos({
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
    this.user,
  });

  UserVideos copyWith({
    int? id,
    String? video,
    String? description,
    String? sound,
    String? soundName,
    int? soundId,
    String? soundCategoryName,
    dynamic filter,
    int? likes,
    int? views,
    String? gifImage,
    String? speed,
    int? comments,
    dynamic hashtags,
    String? isDuet,
    dynamic duetFrom,
    String? isDuetable,
    String? isCommentable,
    String? soundOwner,
    User? user,
  }) =>
      UserVideos(
        id: id ?? this.id,
        video: video ?? this.video,
        description: description ?? this.description,
        sound: sound ?? this.sound,
        soundName: soundName ?? this.soundName,
        soundId: soundId ?? this.soundId,
        soundCategoryName: soundCategoryName ?? this.soundCategoryName,
        filter: filter ?? this.filter,
        likes: likes ?? this.likes,
        views: views ?? this.views,
        gifImage: gifImage ?? this.gifImage,
        speed: speed ?? this.speed,
        comments: comments ?? this.comments,
        hashtags: hashtags ?? this.hashtags,
        isDuet: isDuet ?? this.isDuet,
        duetFrom: duetFrom ?? this.duetFrom,
        isDuetable: isDuetable ?? this.isDuetable,
        isCommentable: isCommentable ?? this.isCommentable,
        soundOwner: soundOwner ?? this.soundOwner,
        user: user ?? this.user,
      );

  factory UserVideos.fromMap(Map<String, dynamic> json) => UserVideos(
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
    hashtags: json["hashtags"],
    isDuet: json["is_duet"],
    duetFrom: json["duet_from"],
    isDuetable: json["is_duetable"],
    isCommentable: json["is_commentable"],
    soundOwner: json["sound_owner"],
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
    "hashtags": hashtags,
    "is_duet": isDuet,
    "duet_from": duetFrom,
    "is_duetable": isDuetable,
    "is_commentable": isCommentable,
    "sound_owner": soundOwner,
    "user": user?.toMap(),
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

  User copyWith({
    int? id,
    String? name,
    String? username,
    dynamic email,
    String? dob,
    String? phone,
    String? avatar,
    dynamic socialLoginId,
    dynamic socialLoginType,
    String? firstName,
    String? lastName,
    String? gender,
    dynamic websiteUrl,
    String? bio,
    dynamic youtube,
    dynamic facebook,
    dynamic instagram,
    dynamic twitter,
    String? firebaseToken,
    String? referralCount,
    String? following,
    String? followers,
    int? isfollow,
    String? likes,
    Levels? levels,
    String? totalVideos,
    String? boxTwo,
    String? boxThree,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
        dob: dob ?? this.dob,
        phone: phone ?? this.phone,
        avatar: avatar ?? this.avatar,
        socialLoginId: socialLoginId ?? this.socialLoginId,
        socialLoginType: socialLoginType ?? this.socialLoginType,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        websiteUrl: websiteUrl ?? this.websiteUrl,
        bio: bio ?? this.bio,
        youtube: youtube ?? this.youtube,
        facebook: facebook ?? this.facebook,
        instagram: instagram ?? this.instagram,
        twitter: twitter ?? this.twitter,
        firebaseToken: firebaseToken ?? this.firebaseToken,
        referralCount: referralCount ?? this.referralCount,
        following: following ?? this.following,
        followers: followers ?? this.followers,
        isfollow: isfollow ?? this.isfollow,
        likes: likes ?? this.likes,
        levels: levels ?? this.levels,
        totalVideos: totalVideos ?? this.totalVideos,
        boxTwo: boxTwo ?? this.boxTwo,
        boxThree: boxThree ?? this.boxThree,
      );

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

  Levels copyWith({
    String? current,
    String? next,
    String? progress,
  }) =>
      Levels(
        current: current ?? this.current,
        next: next ?? this.next,
        progress: progress ?? this.progress,
      );

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
  dynamic nextPageUrl;

  Pagination({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
    this.firstPageUrl,
    this.nextPageUrl,
  });

  Pagination copyWith({
    int? currentPage,
    int? lastPage,
    int? perPage,
    int? total,
    String? firstPageUrl,
    dynamic nextPageUrl,
  }) =>
      Pagination(
        currentPage: currentPage ?? this.currentPage,
        lastPage: lastPage ?? this.lastPage,
        perPage: perPage ?? this.perPage,
        total: total ?? this.total,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      );

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
