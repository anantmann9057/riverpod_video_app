// To parse this JSON data, do
//
//     final videoLikeModel = videoLikeModelFromMap(jsonString);

import 'dart:convert';

VideoLikeModel videoLikeModelFromMap(String str) =>
    VideoLikeModel.fromMap(json.decode(str));

String videoLikeModelToMap(VideoLikeModel data) => json.encode(data.toMap());

class VideoLikeModel {
  bool? status;
  Data? data;
  String? message;
  bool? error;

  VideoLikeModel({
    this.status,
    this.data,
    this.message,
    this.error,
  });

  factory VideoLikeModel.fromMap(Map<String, dynamic> json) => VideoLikeModel(
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

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        likes: json["likes"],
        isLike: json["is_like"],
      );

  Map<String, dynamic> toMap() => {
        "likes": likes,
        "is_like": isLike,
      };
}
