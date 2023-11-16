// To parse this JSON data, do
//
//     final selectedSoundModel = selectedSoundModelFromMap(jsonString);

import 'dart:convert';

SelectedSoundModel selectedSoundModelFromMap(String str) =>
    SelectedSoundModel.fromMap(json.decode(str));

String selectedSoundModelToMap(SelectedSoundModel data) =>
    json.encode(data.toMap());

class SelectedSoundModel {
  bool? status;
  Data? data;
  String? message;
  bool? error;

  SelectedSoundModel({
    this.status,
    this.data,
    this.message,
    this.error,
  });

  factory SelectedSoundModel.fromMap(Map<String, dynamic> json) =>
      SelectedSoundModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        message: json["message"],
        error: json["error"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data?.toMap(),
        "message": message,
        "error": error,
      };
}

class Data {
  int? id;
  String? sound;
  int? userId;
  String? category;
  String? name;
  dynamic thumbnail;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? soundUsedCount;
  SoundOwner? soundOwner;
  dynamic isFavouriteSound;

  Data({
    this.id,
    this.sound,
    this.userId,
    this.category,
    this.name,
    this.thumbnail,
    this.createdAt,
    this.updatedAt,
    this.soundUsedCount,
    this.soundOwner,
    this.isFavouriteSound,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
        soundOwner: json["sound_owner"] == null
            ? null
            : SoundOwner.fromMap(json["sound_owner"]),
        isFavouriteSound: json["is_favourite_sound"],
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
        "sound_owner": soundOwner?.toMap(),
        "is_favourite_sound": isFavouriteSound,
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
