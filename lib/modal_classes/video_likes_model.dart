// To parse this JSON data, do
//
//     final videoLikesModel = videoLikesModelFromMap(jsonString);

import 'dart:convert';

VideoLikesModel videoLikesModelFromMap(String str) => VideoLikesModel.fromMap(json.decode(str));

String videoLikesModelToMap(VideoLikesModel data) => json.encode(data.toMap());

class VideoLikesModel {
  bool? status;
  Data? data;
  String? message;
  bool? error;

  VideoLikesModel({
    this.status,
    this.data,
    this.message,
    this.error,
  });

  VideoLikesModel copyWith({
    bool? status,
    Data? data,
    String? message,
    bool? error,
  }) =>
      VideoLikesModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
        error: error ?? this.error,
      );

  factory VideoLikesModel.fromMap(Map<String, dynamic> json) => VideoLikesModel(
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
  int? likes;
  dynamic? isLike;

  Data({
    this.likes,
    this.isLike,
  });

  Data copyWith({
    int? likes,
    int? isLike,
  }) =>
      Data(
        likes: likes ?? this.likes,
        isLike: isLike ?? this.isLike,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    likes: json["likes"],
    isLike: json["is_like"],
  );

  Map<String, dynamic> toMap() => {
    "likes": likes,
    "is_like": isLike,
  };
}
