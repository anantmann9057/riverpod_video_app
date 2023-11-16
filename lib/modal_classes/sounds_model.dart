// To parse this JSON data, do
//
//     final soundsModel = soundsModelFromMap(jsonString);

import 'dart:convert';

SoundsModel soundsModelFromMap(String str) =>
    SoundsModel.fromMap(json.decode(str));

String soundsModelToMap(SoundsModel data) => json.encode(data.toMap());

class SoundsModel {
  bool? status;
  bool? error;
  String? message;
  List<Datum>? data;
  Pagination? pagination;

  SoundsModel({
    this.status,
    this.error,
    this.message,
    this.data,
    this.pagination,
  });

  factory SoundsModel.fromMap(Map<String, dynamic> json) => SoundsModel(
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
  String? sound;
  int? userId;
  String? category;
  String? name;
  dynamic thumbnail;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? soundUsedCount;
  int? isFavouriteSoundCount;
  SoundOwner? soundOwner;

  Datum({
    this.id,
    this.sound,
    this.userId,
    this.category,
    this.name,
    this.thumbnail,
    this.createdAt,
    this.updatedAt,
    this.soundUsedCount,
    this.isFavouriteSoundCount,
    this.soundOwner,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sound: json["sound"],
        userId: json["user_id"],
        category: json["category"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        soundUsedCount: json["sound_used_count"],
        isFavouriteSoundCount: json["is_favourite_sound_count"],
        soundOwner: json["sound_owner"] == null
            ? null
            : SoundOwner.fromMap(json["sound_owner"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "sound": sound,
        "user_id": userId,
        "category": category,
        "name": name,
        "thumbnail": thumbnail,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "sound_used_count": soundUsedCount,
        "is_favourite_sound_count": isFavouriteSoundCount,
        "sound_owner": soundOwner?.toMap(),
      };
}

class SoundOwner {
  int? id;
  String? name;
  String? avtars;
  String? username;

  SoundOwner({
    this.id,
    this.name,
    this.avtars,
    this.username,
  });

  factory SoundOwner.fromMap(Map<String, dynamic> json) => SoundOwner(
        id: json["id"],
        name: json["name"],
        avtars: json["avtars"],
        username: json["username"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "avtars": avtars,
        "username": username,
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
